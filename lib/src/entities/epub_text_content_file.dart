import 'package:quiver/core.dart';

import 'epub_content_file.dart';

class EpubTextContentFile extends EpubContentFile {
  late final String Content;

  @override
  int get hashCode => hash4(Content, ContentMimeType, ContentType, FileName);

  @override
  bool operator ==(other) {
    var otherAs = other as EpubTextContentFile;
    if (otherAs == null) {
      return false;
    }
    return Content == otherAs.Content &&
        ContentMimeType == otherAs.ContentMimeType &&
        ContentType == otherAs.ContentType &&
        FileName == otherAs.FileName;
  }
}
