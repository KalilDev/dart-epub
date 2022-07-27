import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_manifest_item.dart';

class EpubManifest {
  final List<EpubManifestItem> Items = [];

  @override
  int get hashCode {
    return hashObjects(Items.map((item) => item.hashCode));
  }

  @override
  bool operator ==(other) {
    var otherAs = other as EpubManifest;
    return collections.listsEqual(Items, otherAs.Items);
  }
}
