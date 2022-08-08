import 'dart:async';

import 'package:archive/archive.dart';

import 'readers/content_reader.dart';
import 'readers/schema_reader.dart';
import 'entities.dart';
import 'ref_entities.dart';
import 'schema/opf.dart';

class EpubReader {
  /// Opens the book asynchronously without reading its content. Holds the handle to the EPUB file.
  static Future<EpubBookRef> openBook(List<int> bytes) async {
    final epubArchive = ZipDecoder().decodeBytes(bytes);

    final schema = await SchemaReader.readSchema(epubArchive);
    schema.package.metadata.titles
        .firstWhere((String name) => true, orElse: () => '');
    final authorList = schema.package.metadata.creators
        .map((EpubMetadataCreator creator) => creator.creator)
        .toList();
    final author = authorList.join(', ');
    final constData = ConstEpubBookRefData(
      epubArchive,
      null,
      author,
      authorList,
      schema,
    );
    final bookRef = EpubBookRef(constData);
    bookRef.content = ContentReader.parseContentMap(bookRef);
    return bookRef;
  }

  /// Opens the book asynchronously and reads all of its content into the memory. Does not hold the handle to the EPUB file.
  static Future<EpubBook> readBook(List<int> bytes) async {
    final epubBookRef = await openBook(bytes);
    final chapterRefs = await epubBookRef.getChapters();
    final result = EpubBook(
      epubBookRef.title,
      epubBookRef.author,
      epubBookRef.authorList,
      epubBookRef.schema,
      await readContent(epubBookRef.content),
      await epubBookRef.readCover(),
      await readChapters(chapterRefs),
    );

    return result;
  }

  static Future<EpubContent> readContent(EpubContentRef contentRef) async {
    final result = EpubContent(
      await readTextContentFiles(contentRef.html),
      await readTextContentFiles(contentRef.css),
      await readByteContentFiles(contentRef.images),
      await readByteContentFiles(contentRef.fonts),
    );

    await Future.forEach(contentRef.allFiles.keys, (String key) async {
      if (!result.allFiles.containsKey(key)) {
        result.allFiles[key] =
            await readByteContentFile(contentRef.allFiles[key]!);
      }
    });

    return result;
  }

  static Future<Map<String, EpubTextContentFile>> readTextContentFiles(
      Map<String, EpubTextContentFileRef> textContentFileRefs) async {
    final result = <String, EpubTextContentFile>{};

    await Future.forEach(textContentFileRefs.keys, (String key) async {
      EpubContentFileRef value = textContentFileRefs[key]!;
      final textContentFile = EpubTextContentFile(
        value.fileName,
        value.contentType,
        value.contentMimeType,
        await value.readContentAsText(),
      );
      result[key] = textContentFile;
    });
    return result;
  }

  static Future<Map<String, EpubByteContentFile>> readByteContentFiles(
      Map<String, EpubByteContentFileRef> byteContentFileRefs) async {
    final result = <String, EpubByteContentFile>{};
    await Future.forEach(byteContentFileRefs.keys, (String key) async {
      result[key] = await readByteContentFile(byteContentFileRefs[key]!);
    });
    return result;
  }

  static Future<EpubByteContentFile> readByteContentFile(
      EpubContentFileRef contentFileRef) async {
    final result = EpubByteContentFile(
      contentFileRef.fileName,
      contentFileRef.contentType,
      contentFileRef.contentMimeType,
      await contentFileRef.readContentAsBytes(),
    );

    return result;
  }

  static Future<List<EpubChapter>> readChapters(
      List<EpubChapterRef> chapterRefs) async {
    final result = <EpubChapter>[];
    await Future.forEach(chapterRefs, (EpubChapterRef chapterRef) async {
      final chapter = EpubChapter(
        chapterRef.title,
        chapterRef.contentFileName,
        chapterRef.anchor,
        await chapterRef.readHtmlContent(),
        await readChapters(chapterRef.subChapters!),
      );

      result.add(chapter);
    });
    return result;
  }
}
