import 'package:quiver/core.dart';

class EpubNavigationContent {
  String Id;
  String Source;

  @override
  int get hashCode => hash2(Id.hashCode, Source.hashCode);

  @override
  bool operator ==(other) {
    var otherAs = other as EpubNavigationContent;
    if (otherAs == null) return false;
    return Id == otherAs.Id && Source == otherAs.Source;
  }

  @override
  String toString() {
    return 'Source: $Source';
  }
}
