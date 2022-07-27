import 'dart:async';

import 'package:archive/archive.dart';
import 'dart:convert' as convert;
import 'package:quiver/core.dart';

import '../entities/epub_content_type.dart';
import '../utils/zip_path_utils.dart';
import 'epub_book_ref.dart';

abstract class EpubContentFileRef {
  final EpubBookRef epubBookRef;

  String FileName;

  EpubContentType ContentType;
  String ContentMimeType;
  EpubContentFileRef(this.epubBookRef);

  @override
  int get hashCode =>
      hash3(FileName.hashCode, ContentMimeType.hashCode, ContentType.hashCode);

  @override
  bool operator ==(other) {
    return (other is EpubContentFileRef &&
        other.FileName == FileName &&
        other.ContentMimeType == ContentMimeType &&
        other.ContentType == ContentType);
  }

  ArchiveFile getContentFileEntry() {
    final contentFilePath =
        ZipPathUtils.combine(epubBookRef.Schema.ContentDirectoryPath, FileName);
    final contentFileEntry = epubBookRef.EpubArchive().files.firstWhere(
        (ArchiveFile x) => x.name == contentFilePath,
        orElse: () => null);
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
          'Incorrect EPUB file: content file \"$FileName\" specified in manifest is not found.');
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
