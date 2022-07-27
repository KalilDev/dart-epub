import 'dart:async';

import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_text_content_file_ref.dart';

class EpubChapterRef {
  final EpubTextContentFileRef? epubTextContentFileRef;

  late final String Title;
  late final String ContentFileName;
  late final String? Anchor;
  late final List<EpubChapterRef>? SubChapters;

  EpubChapterRef(this.epubTextContentFileRef);

  @override
  int get hashCode {
    final objects = [
      Title.hashCode,
      ContentFileName.hashCode,
      Anchor.hashCode,
      epubTextContentFileRef.hashCode,
      ...SubChapters?.map((subChapter) => subChapter.hashCode) ?? [0]
    ];
    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    final otherAs = other as EpubChapterRef;
    return Title == otherAs.Title &&
        ContentFileName == otherAs.ContentFileName &&
        Anchor == otherAs.Anchor &&
        epubTextContentFileRef == otherAs.epubTextContentFileRef &&
        collections.listsEqual(SubChapters, otherAs.SubChapters);
  }

  Future<String> readHtmlContent() async {
    return epubTextContentFileRef!.readContentAsText();
  }

  @override
  String toString() {
    return 'Title: $Title, Subchapter count: ${SubChapters!.length}';
  }
}
