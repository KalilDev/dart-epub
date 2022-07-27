import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_navigation_head_meta.dart';

class EpubNavigationHead {
  final List<EpubNavigationHeadMeta> Metadata = [];

  @override
  int get hashCode {
    var objects = [...Metadata.map((meta) => meta.hashCode)];
    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    var otherAs = other as EpubNavigationHead;

    return collections.listsEqual(Metadata, otherAs.Metadata);
  }
}
