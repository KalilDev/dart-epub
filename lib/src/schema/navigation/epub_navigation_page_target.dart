import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_metadata.dart';
import 'epub_navigation_label.dart';
import 'epub_navigation_page_target_type.dart';

class EpubNavigationPageTarget {
  late final String Id;
  late final String Value;
  late final EpubNavigationPageTargetType? Type;
  late final String Class;
  late final String PlayOrder;
  final List<EpubNavigationLabel> NavigationLabels = [];
  late final EpubNavigationContent Content;

  @override
  int get hashCode {
    var objects = [
      Id.hashCode,
      Value.hashCode,
      Type.hashCode,
      Class.hashCode,
      PlayOrder.hashCode,
      Content.hashCode,
      ...NavigationLabels.map((label) => label.hashCode)
    ];
    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    var otherAs = other as EpubNavigationPageTarget;

    if (!(Id == otherAs.Id &&
        Value == otherAs.Value &&
        Type == otherAs.Type &&
        Class == otherAs.Class &&
        PlayOrder == otherAs.PlayOrder &&
        Content == otherAs.Content)) {
      return false;
    }

    return collections.listsEqual(NavigationLabels, otherAs.NavigationLabels);
  }
}
