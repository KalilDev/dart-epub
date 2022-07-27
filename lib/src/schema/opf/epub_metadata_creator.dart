import 'package:quiver/core.dart';

class EpubMetadataCreator {
  late final String Creator;
  late final String? FileAs;
  late final String? Role;

  @override
  int get hashCode => hash3(Creator.hashCode, FileAs.hashCode, Role.hashCode);

  @override
  bool operator ==(other) {
    var otherAs = other as EpubMetadataCreator;
    if (otherAs == null) return false;
    return Creator == otherAs.Creator &&
        FileAs == otherAs.FileAs &&
        Role == otherAs.Role;
  }
}
