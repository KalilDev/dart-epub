import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_byte_content_file.dart';
import 'epub_content_file.dart';
import 'epub_text_content_file.dart';

class EpubContent {
  final Map<String, EpubTextContentFile> Html = {};
  final Map<String, EpubTextContentFile> Css = {};
  final Map<String, EpubByteContentFile> Images = {};
  final Map<String, EpubByteContentFile> Fonts = {};
  final Map<String, EpubContentFile> AllFiles = {};

  @override
  int get hashCode {
    final objects = [
      ...Html.keys.map((key) => key.hashCode),
      ...Html.values.map((value) => value.hashCode),
      ...Css.keys.map((key) => key.hashCode),
      ...Css.values.map((value) => value.hashCode),
      ...Images.keys.map((key) => key.hashCode),
      ...Images.values.map((value) => value.hashCode),
      ...Fonts.keys.map((key) => key.hashCode),
      ...Fonts.values.map((value) => value.hashCode),
      ...AllFiles.keys.map((key) => key.hashCode),
      ...AllFiles.values.map((value) => value.hashCode)
    ];

    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    final otherAs = other as EpubContent;

    return collections.mapsEqual(Html, otherAs.Html) &&
        collections.mapsEqual(Css, otherAs.Css) &&
        collections.mapsEqual(Images, otherAs.Images) &&
        collections.mapsEqual(Fonts, otherAs.Fonts) &&
        collections.mapsEqual(AllFiles, otherAs.AllFiles);
  }
}
