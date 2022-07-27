import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_byte_content_file_ref.dart';
import 'epub_content_file_ref.dart';
import 'epub_text_content_file_ref.dart';

class EpubContentRef {
  Map<String, EpubTextContentFileRef> Html;
  Map<String, EpubTextContentFileRef> Css;
  Map<String, EpubByteContentFileRef> Images;
  Map<String, EpubByteContentFileRef> Fonts;
  Map<String, EpubContentFileRef> AllFiles;

  EpubContentRef() {
    Html = {};
    Css = {};
    Images = {};
    Fonts = {};
    AllFiles = {};
  }

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
    if (otherAs == null) {
      return false;
    }

    return collections.mapsEqual(Html, otherAs.Html) &&
        collections.mapsEqual(Css, otherAs.Css) &&
        collections.mapsEqual(Images, otherAs.Images) &&
        collections.mapsEqual(Fonts, otherAs.Fonts) &&
        collections.mapsEqual(AllFiles, otherAs.AllFiles);
  }
}
