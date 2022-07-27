import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

class EpubChapter {
  late final String Title;
  late final String ContentFileName;
  late final String? Anchor;
  late final String HtmlContent;
  late final List<EpubChapter>? SubChapters;

  @override
  int get hashCode {
    final objects = [
      Title.hashCode,
      ContentFileName.hashCode,
      Anchor.hashCode,
      HtmlContent.hashCode,
      ...SubChapters?.map((subChapter) => subChapter.hashCode) ?? [0]
    ];
    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    final otherAs = other as EpubChapter;
    if (otherAs == null) {
      return false;
    }
    return Title == otherAs.Title &&
        ContentFileName == otherAs.ContentFileName &&
        Anchor == otherAs.Anchor &&
        HtmlContent == otherAs.HtmlContent &&
        collections.listsEqual(SubChapters, otherAs.SubChapters);
  }

  @override
  String toString() {
    return 'Title: $Title, Subchapter count: ${SubChapters!.length}';
  }
}
