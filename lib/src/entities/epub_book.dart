import 'package:image/image.dart';
import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_chapter.dart';
import 'epub_content.dart';
import 'epub_schema.dart';

class EpubBook {
  String Title;
  String Author;
  List<String> AuthorList;
  EpubSchema Schema;
  EpubContent Content;
  Image CoverImage;
  List<EpubChapter> Chapters;

  @override
  int get hashCode {
    final objects = [
      Title.hashCode,
      Author.hashCode,
      Schema.hashCode,
      Content.hashCode,
      ...CoverImage?.getBytes()?.map((byte) => byte.hashCode) ?? [0],
      ...AuthorList?.map((author) => author.hashCode) ?? [0],
      ...Chapters?.map((chapter) => chapter.hashCode) ?? [0]
    ];
    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    final otherAs = other as EpubBook;
    if (otherAs == null) {
      return false;
    }

    return Title == otherAs.Title &&
        Author == otherAs.Author &&
        collections.listsEqual(AuthorList, otherAs.AuthorList) &&
        Schema == otherAs.Schema &&
        Content == otherAs.Content &&
        collections.listsEqual(
            CoverImage.getBytes(), otherAs.CoverImage.getBytes()) &&
        collections.listsEqual(Chapters, otherAs.Chapters);
  }
}
