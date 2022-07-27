import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_navigation_point.dart';

class EpubNavigationMap {
  final List<EpubNavigationPoint> Points = [];

  @override
  int get hashCode {
    return hashObjects(Points.map((point) => point.hashCode));
  }

  @override
  bool operator ==(other) {
    var otherAs = other as EpubNavigationMap;

    return collections.listsEqual(Points, otherAs.Points);
  }
}
