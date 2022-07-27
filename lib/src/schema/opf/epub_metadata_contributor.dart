import 'package:quiver/core.dart';

class EpubMetadataContributor {
  late final String Contributor;
  late final String FileAs;
  late final String Role;

  @override
  int get hashCode =>
      hash3(Contributor.hashCode, FileAs.hashCode, Role.hashCode);

  @override
  bool operator ==(other) {
    var otherAs = other as EpubMetadataContributor;

    return Contributor == otherAs.Contributor &&
        FileAs == otherAs.FileAs &&
        Role == otherAs.Role;
  }
}
