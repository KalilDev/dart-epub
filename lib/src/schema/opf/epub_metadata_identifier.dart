import 'package:quiver/core.dart';

class EpubMetadataIdentifier {
  late final String? Id;
  late final String? Scheme;
  late final String Identifier;

  @override
  int get hashCode => hash3(Id.hashCode, Scheme.hashCode, Identifier.hashCode);

  @override
  bool operator ==(other) {
    var otherAs = other as EpubMetadataIdentifier;
    return Id == otherAs.Id &&
        Scheme == otherAs.Scheme &&
        Identifier == otherAs.Identifier;
  }
}
