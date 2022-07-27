import 'package:image/image.dart';
import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_chapter.dart';
import 'epub_content.dart';
import 'epub_schema.dart';

class EpubBook {
  late final String Title;
  late final String Author;
  late final List<String>? AuthorList;
  late final EpubSchema Schema;
  late final EpubContent Content;
  late final Image? CoverImage;
  late final List<EpubChapter>? Chapters;

  @override
  int get hashCode {
    final objects = [
      Title.hashCode,
      Author.hashCode,
      Schema.hashCode,
      Content.hashCode,
      ...CoverImage?.getBytes().map((byte) => byte.hashCode) ?? [0],
      ...AuthorList?.map((author) => author.hashCode) ?? [0],
      ...Chapters?.map((chapter) => chapter.hashCode) ?? [0]
    ];
    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    final otherAs = other as EpubBook;

    return Title == otherAs.Title &&
        Author == otherAs.Author &&
        collections.listsEqual(AuthorList, otherAs.AuthorList) &&
        Schema == otherAs.Schema &&
        Content == otherAs.Content &&
        collections.listsEqual(
            CoverImage!.getBytes(), otherAs.CoverImage!.getBytes()) &&
        collections.listsEqual(Chapters, otherAs.Chapters);
  }
}
