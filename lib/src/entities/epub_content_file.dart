import 'package:quiver/core.dart';

import 'epub_content_type.dart';

abstract class EpubContentFile {
  late final String? FileName;
  late final EpubContentType? ContentType;
  late final String? ContentMimeType;

  @override
  int get hashCode =>
      hash3(FileName.hashCode, ContentType.hashCode, ContentMimeType.hashCode);

  @override
  bool operator ==(other) {
    final otherAs = other as EpubContentFile;
    return FileName == otherAs.FileName &&
        ContentType == otherAs.ContentType &&
        ContentMimeType == otherAs.ContentMimeType;
  }
}
