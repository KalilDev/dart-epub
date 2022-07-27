import 'package:quiver/core.dart';

class EpubManifestItem {
  late final String Id;
  late final String Href;
  late final String MediaType;
  late final String RequiredNamespace;
  late final String RequiredModules;
  late final String Fallback;
  late final String FallbackStyle;

  @override
  int get hashCode => hashObjects([
        Id.hashCode,
        Href.hashCode,
        MediaType.hashCode,
        RequiredNamespace.hashCode,
        RequiredModules.hashCode,
        Fallback.hashCode,
        FallbackStyle.hashCode
      ]);

  @override
  bool operator ==(other) {
    var otherAs = other as EpubManifestItem;
    if (otherAs == null) {
      return false;
    }

    return Id == otherAs.Id &&
        Href == otherAs.Href &&
        MediaType == otherAs.MediaType &&
        RequiredNamespace == otherAs.RequiredNamespace &&
        RequiredModules == otherAs.RequiredModules &&
        Fallback == otherAs.Fallback &&
        FallbackStyle == otherAs.FallbackStyle;
  }

  @override
  String toString() {
    return 'Id: $Id, Href = $Href, MediaType = $MediaType';
  }
}
