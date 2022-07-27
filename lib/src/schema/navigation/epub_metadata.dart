import 'package:quiver/core.dart';

class EpubNavigationContent {
  /* late final */ String Id;
  /* late final */ String Source;

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
