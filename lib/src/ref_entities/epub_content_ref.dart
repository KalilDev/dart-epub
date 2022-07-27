import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_byte_content_file_ref.dart';
import 'epub_content_file_ref.dart';
import 'epub_text_content_file_ref.dart';

class EpubContentRef {
  final Map<String, EpubTextContentFileRef> Html = {};
  final Map<String, EpubTextContentFileRef> Css = {};
  final Map<String, EpubByteContentFileRef> Images = {};
  final Map<String, EpubByteContentFileRef> Fonts = {};
  final Map<String, EpubContentFileRef> AllFiles = {};

  @override
  int get hashCode {
    var objects = [
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
    var otherAs = other as EpubContentRef;

    return collections.mapsEqual(Html, otherAs.Html) &&
        collections.mapsEqual(Css, otherAs.Css) &&
        collections.mapsEqual(Images, otherAs.Images) &&
        collections.mapsEqual(Fonts, otherAs.Fonts) &&
        collections.mapsEqual(AllFiles, otherAs.AllFiles);
  }
}
