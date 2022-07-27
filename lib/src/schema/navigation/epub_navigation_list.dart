import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_navigation_label.dart';
import 'epub_navigation_target.dart';

class EpubNavigationList {
  late final String Id;
  late final String Class;
  late final List<EpubNavigationLabel> NavigationLabels;
  late final List<EpubNavigationTarget> NavigationTargets;

  @override
  int get hashCode {
    var objects = [
      Id.hashCode,
      Class.hashCode,
      ...NavigationLabels.map((label) => label.hashCode),
      ...NavigationTargets.map((target) => target.hashCode)
    ];
    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    var otherAs = other as EpubNavigationList;

    if (!(Id == otherAs.Id && Class == otherAs.Class)) {
      return false;
    }

    if (!collections.listsEqual(NavigationLabels, otherAs.NavigationLabels)) {
      return false;
    }
    if (!collections.listsEqual(NavigationTargets, otherAs.NavigationTargets)) {
      return false;
    }
    return true;
  }
}
