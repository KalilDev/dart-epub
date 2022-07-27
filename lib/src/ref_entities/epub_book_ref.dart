import 'dart:async';

import 'package:archive/archive.dart';
import 'package:image/image.dart';
import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import '../entities/epub_schema.dart';
import '../readers/book_cover_reader.dart';
import '../readers/chapter_reader.dart';
import 'epub_chapter_ref.dart';
import 'epub_content_ref.dart';

class EpubBookRef {
  Archive _epubArchive;

  String Title;
  String Author;
  List<String> AuthorList;
  EpubSchema Schema;
  EpubContentRef Content;
  EpubBookRef(Archive epubArchive) {
    _epubArchive = epubArchive;
  }

  @override
  int get hashCode {
    final objects = [
      Title.hashCode,
      Author.hashCode,
      Schema.hashCode,
      Content.hashCode,
      ...AuthorList?.map((author) => author.hashCode) ?? [0]
    ];
    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    final otherAs = other as EpubBookRef;
    if (otherAs == null) {
      return false;
    }
    return Title == otherAs.Title &&
        Author == otherAs.Author &&
        Schema == otherAs.Schema &&
        Content == otherAs.Content &&
        collections.listsEqual(AuthorList, otherAs.AuthorList);
  }

  Archive EpubArchive() {
    return _epubArchive;
  }

  Future<List<EpubChapterRef>> getChapters() async {
    return ChapterReader.getChapters(this);
  }

  Future<Image> readCover() async {
    return await BookCoverReader.readBookCover(this);
  }
}
