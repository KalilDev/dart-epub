import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_spine_item_ref.dart';

class EpubSpine {
  late final String TableOfContents;
  final List<EpubSpineItemRef> Items = [];

  @override
  int get hashCode {
    var objs = [
      TableOfContents.hashCode,
      ...Items.map((item) => item.hashCode)
    ];
    return hashObjects(objs);
  }

  @override
  bool operator ==(other) {
    var otherAs = other as EpubSpine;
    if (otherAs == null) return false;

    if (!collections.listsEqual(Items, otherAs.Items)) {
      return false;
    }
    return TableOfContents == otherAs.TableOfContents;
  }
}
