import 'package:quiver/core.dart';

class EpubMetadataMeta {
  late final String? Name;
  late final String? Content;
  late final String? Id;
  late final String? Refines;
  late final String? Property;
  late final String? Scheme;

  @override
  int get hashCode => hashObjects([
        Name.hashCode,
        Content.hashCode,
        Id.hashCode,
        Refines.hashCode,
        Property.hashCode,
        Scheme.hashCode
      ]);

  @override
  bool operator ==(other) {
    var otherAs = other as EpubMetadataMeta;
    return Name == otherAs.Name &&
        Content == otherAs.Content &&
        Id == otherAs.Id &&
        Refines == otherAs.Refines &&
        Property == otherAs.Property &&
        Scheme == otherAs.Scheme;
  }
}
