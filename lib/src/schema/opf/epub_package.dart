import 'package:quiver/core.dart';

import 'epub_guide.dart';
import 'epub_manifest.dart';
import 'epub_metadata.dart';
import 'epub_spine.dart';
import 'epub_version.dart';

class EpubPackage {
  late final EpubVersion Version;
  late final EpubMetadata Metadata;
  late final EpubManifest Manifest;
  late final EpubSpine Spine;
  late final EpubGuide Guide;

  @override
  int get hashCode => hashObjects([
        Version.hashCode,
        Metadata.hashCode,
        Manifest.hashCode,
        Spine.hashCode,
        Guide.hashCode
      ]);

  @override
  bool operator ==(other) {
    var otherAs = other as EpubPackage;
    if (otherAs == null) {
      return false;
    }

    return Version == otherAs.Version &&
        Metadata == otherAs.Metadata &&
        Manifest == otherAs.Manifest &&
        Spine == otherAs.Spine &&
        Guide == otherAs.Guide;
  }
}
