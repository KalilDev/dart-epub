import 'package:quiver/core.dart';

import '../schema/navigation/epub_navigation.dart';
import '../schema/opf/epub_package.dart';

class EpubSchema {
  /* late final */ EpubPackage Package;
  /* late final */ EpubNavigation/*!*/ Navigation;
  /* late final */ String ContentDirectoryPath;

  @override
  int get hashCode => hash3(
      Package.hashCode, Navigation.hashCode, ContentDirectoryPath.hashCode);

  @override
  bool operator ==(other) {
    var otherAs = other as EpubSchema;
    if (otherAs == null) {
      return false;
    }

    return Package == otherAs.Package &&
        Navigation == otherAs.Navigation &&
        ContentDirectoryPath == otherAs.ContentDirectoryPath;
  }
}
