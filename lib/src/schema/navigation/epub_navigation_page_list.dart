import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_navigation_page_target.dart';

class EpubNavigationPageList {
  final List<EpubNavigationPageTarget> Targets = [];

  @override
  int get hashCode {
    return hashObjects(Targets.map((target) => target.hashCode));
  }

  @override
  bool operator ==(other) {
    var otherAs = other as EpubNavigationPageList;

    return collections.listsEqual(Targets, otherAs.Targets);
  }
}
