// ignore_for_file: unused_element

import 'package:adt_annotation/adt_annotation.dart';
import 'utils/zip_path_utils.dart';
import 'package:archive/archive.dart';
import 'dart:convert' as convert;
import 'package:collection/collection.dart' show IterableExtension;
import 'entities.dart';
import 'package:image/image.dart';
import 'readers/book_cover_reader.dart';
import 'readers/chapter_reader.dart';
part 'ref_entities.g.dart';

@data(
  #ConstEpubBookRefData,
  [],
  Record(
    {
      #_epubArchive: T(#Archive),
      #title: T.n(#String),
      #author: T(#String),
      #authorList: T(#List, args: [T(#String)]),
      #schema: T(#EpubSchema),
    },
  ),
)
const Type _ConstEpubBookRefData = ConstEpubBookRefData;

class EpubBookRef {
  late final EpubContentRef content;
  final ConstEpubBookRefData _constData;

  EpubBookRef(this._constData);
  Archive get _epubArchive => _constData._epubArchive;
  String? get title => _constData.title;
  String get author => _constData.author;
  List<String> get authorList => _constData.authorList;
  EpubSchema get schema => _constData.schema;
}

@data(
  #EpubContentFileRef,
  [],
  Union(
    {
      #EpubByteContentFileRef: {
        #epubBookRef: T(#EpubBookRef),
        #fileName: T(#String),
        #contentType: T(#EpubContentType),
        #contentMimeType: T(#String),
      },
      #EpubTextContentFileRef: {
        #epubBookRef: T(#EpubBookRef),
        #fileName: T(#String),
        #contentType: T(#EpubContentType),
        #contentMimeType: T(#String),
      },
    },
  ),
  mixin: [
    T(#_BaseEpubContentFileRef),
  ],
)
const Type _EpubContentFileRef = EpubContentFileRef;

@data(
  #EpubChapterRef,
  [],
  Record(
    {
      #epubTextContentFileRef: T(#EpubTextContentFileRef),
      #title: T(#String),
      #contentFileName: T(#String),
      #anchor: T.n(#String),
      #subChapters: T(#List, args: [T(#EpubChapterRef)]),
    },
  ),
)
const Type _EpubChapterRef = EpubChapterRef;

@data(
  #EpubContentRef,
  [],
  Record(
    {
      #html: T(#Map, args: [T(#String), T(#EpubTextContentFileRef)]),
      #css: T(#Map, args: [T(#String), T(#EpubTextContentFileRef)]),
      #images: T(#Map, args: [T(#String), T(#EpubByteContentFileRef)]),
      #fonts: T(#Map, args: [T(#String), T(#EpubByteContentFileRef)]),
    },
  ),
)
const Type _EpubContentRef = EpubContentRef;

extension EpubContentRefEx on EpubContentRef {
  Map<String, EpubContentFileRef> get allFiles => {
        ...html,
        ...css,
        ...images,
        ...fonts,
      };
}

mixin _BaseEpubContentFileRef {
  EpubBookRef get epubBookRef;
  String get fileName;
  EpubContentType get contentType;
  String get contentMimeType;
}

extension EpubBookRefEx on EpubBookRef {
  Archive EpubArchive() {
    return _epubArchive;
  }

  Future<List<EpubChapterRef>> getChapters() async {
    return await ChapterReader.getChapters(this);
  }

  Future<Image?> readCover() async {
    return await BookCoverReader.readBookCover(this);
  }
}

extension EpubByteContentFileRefEx on EpubByteContentFileRef {
  Future<List<int>> readContent() {
    return readContentAsBytes();
  }
}

extension EpubTextContentFileRefEx on EpubTextContentFileRef {
  Future<String> ReadContentAsync() async {
    return readContentAsText();
  }
}

extension EpubChapterRefEx on EpubChapterRef {
  Future<String> readHtmlContent() async {
    return epubTextContentFileRef.readContentAsText();
  }
}

extension EpubContentFileRefEx on EpubContentFileRef {
  ArchiveFile getContentFileEntry() {
    final contentFilePath = ZipPathUtils.combine(
      epubBookRef.schema.contentDirectoryPath,
      fileName,
    );
    final contentFileEntry = epubBookRef._epubArchive.files
        .firstWhereOrNull((ArchiveFile x) => x.name == contentFilePath);
    if (contentFileEntry == null) {
      throw Exception(
          'EPUB parsing error: file $contentFilePath not found in archive.');
    }
    return contentFileEntry;
  }

  List<int> getContentStream() {
    return openContentStream(getContentFileEntry());
  }

  List<int> openContentStream(ArchiveFile contentFileEntry) {
    final contentStream = <int>[];
    if (contentFileEntry.content == null) {
      throw Exception(
          'Incorrect EPUB file: content file \"$fileName\" specified in manifest is not found.');
    }
    contentStream.addAll(contentFileEntry.content);
    return contentStream;
  }

  Future<List<int>> readContentAsBytes() async {
    final contentFileEntry = getContentFileEntry();
    final content = openContentStream(contentFileEntry);
    return content;
  }

  Future<String> readContentAsText() async {
    final contentStream = getContentStream();
    final result = convert.utf8.decode(contentStream);
    return result;
  }
}
