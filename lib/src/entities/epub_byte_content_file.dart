import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_content_file.dart';

class EpubByteContentFile extends EpubContentFile {
  late final List<int> Content;

  @override
  int get hashCode {
    final objects = [
      ContentMimeType.hashCode,
      ContentType.hashCode,
      FileName.hashCode,
      ...Content.map((content) => content.hashCode)
    ];
    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    final otherAs = other as EpubByteContentFile;

    return collections.listsEqual(Content, otherAs.Content) &&
        ContentMimeType == otherAs.ContentMimeType &&
        ContentType == otherAs.ContentType &&
        FileName == otherAs.FileName;
  }
}
