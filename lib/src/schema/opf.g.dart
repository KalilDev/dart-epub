// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opf.dart';

// **************************************************************************
// AdtGenerator
// **************************************************************************

class EpubGuideReference implements ProductType {
  final String type;
  final String? title;
  final String href;

  const EpubGuideReference(this.type, this.title, this.href) : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([String, Nullable<String>, String]);

  @override
  int get hashCode => Object.hash((EpubGuideReference), type, title, href);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubGuideReference &&
          true &&
          this.type == other.type &&
          this.title == other.title &&
          this.href == other.href);

  @override
  String toString() => "EpubGuideReference { $type, $title, $href }";
}

class EpubGuide implements ProductType {
  final List<EpubGuideReference> items;

  const EpubGuide(this.items) : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([List<EpubGuideReference>]);

  @override
  int get hashCode => Object.hash((EpubGuide), items);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubGuide && true && this.items == other.items);

  @override
  String toString() => "EpubGuide { $items }";
}

class EpubManifestItem implements ProductType {
  final String id;
  final String href;
  final String mediaType;
  final String? requiredNamespaces;
  final String? requiredModules;
  final String? fallback;
  final String? fallbackStyle;

  const EpubManifestItem(
      this.id,
      this.href,
      this.mediaType,
      this.requiredNamespaces,
      this.requiredModules,
      this.fallback,
      this.fallbackStyle)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        String,
        String,
        String,
        Nullable<String>,
        Nullable<String>,
        Nullable<String>,
        Nullable<String>
      ]);

  @override
  int get hashCode => Object.hash((EpubManifestItem), id, href, mediaType,
      requiredNamespaces, requiredModules, fallback, fallbackStyle);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubManifestItem &&
          true &&
          this.id == other.id &&
          this.href == other.href &&
          this.mediaType == other.mediaType &&
          this.requiredNamespaces == other.requiredNamespaces &&
          this.requiredModules == other.requiredModules &&
          this.fallback == other.fallback &&
          this.fallbackStyle == other.fallbackStyle);

  @override
  String toString() =>
      "EpubManifestItem { $id, $href, $mediaType, $requiredNamespaces, $requiredModules, $fallback, $fallbackStyle }";
}

class EpubManifest implements ProductType {
  final List<EpubManifestItem> items;

  const EpubManifest(this.items) : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([List<EpubManifestItem>]);

  @override
  int get hashCode => Object.hash((EpubManifest), items);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubManifest && true && this.items == other.items);

  @override
  String toString() => "EpubManifest { $items }";
}

class EpubMetadataContributor implements ProductType {
  final String contributor;
  final String? fileAs;
  final String? role;

  const EpubMetadataContributor(this.contributor, this.fileAs, this.role)
      : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([String, Nullable<String>, Nullable<String>]);

  @override
  int get hashCode =>
      Object.hash((EpubMetadataContributor), contributor, fileAs, role);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubMetadataContributor &&
          true &&
          this.contributor == other.contributor &&
          this.fileAs == other.fileAs &&
          this.role == other.role);

  @override
  String toString() =>
      "EpubMetadataContributor { $contributor, $fileAs, $role }";
}

class EpubMetadataCreator implements ProductType {
  final String creator;
  final String? fileAs;
  final String? role;

  const EpubMetadataCreator(this.creator, this.fileAs, this.role) : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([String, Nullable<String>, Nullable<String>]);

  @override
  int get hashCode => Object.hash((EpubMetadataCreator), creator, fileAs, role);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubMetadataCreator &&
          true &&
          this.creator == other.creator &&
          this.fileAs == other.fileAs &&
          this.role == other.role);

  @override
  String toString() => "EpubMetadataCreator { $creator, $fileAs, $role }";
}

class EpubMetadataDate implements ProductType {
  final String date;
  final String? event;

  const EpubMetadataDate(this.date, this.event) : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([String, Nullable<String>]);

  @override
  int get hashCode => Object.hash((EpubMetadataDate), date, event);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubMetadataDate &&
          true &&
          this.date == other.date &&
          this.event == other.event);

  @override
  String toString() => "EpubMetadataDate { $date, $event }";
}

class EpubMetadataIdentifier implements ProductType {
  final String identifier;
  final String? id;
  final String? scheme;

  const EpubMetadataIdentifier(this.identifier, this.id, this.scheme) : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([String, Nullable<String>, Nullable<String>]);

  @override
  int get hashCode =>
      Object.hash((EpubMetadataIdentifier), identifier, id, scheme);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubMetadataIdentifier &&
          true &&
          this.identifier == other.identifier &&
          this.id == other.id &&
          this.scheme == other.scheme);

  @override
  String toString() => "EpubMetadataIdentifier { $identifier, $id, $scheme }";
}

class EpubMetadataMeta implements ProductType {
  final String? name;
  final String? content;
  final String? id;
  final String? refines;
  final String? property;
  final String? scheme;

  const EpubMetadataMeta(this.name, this.content, this.id, this.refines,
      this.property, this.scheme)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        Nullable<String>,
        Nullable<String>,
        Nullable<String>,
        Nullable<String>,
        Nullable<String>,
        Nullable<String>
      ]);

  @override
  int get hashCode => Object.hash(
      (EpubMetadataMeta), name, content, id, refines, property, scheme);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubMetadataMeta &&
          true &&
          this.name == other.name &&
          this.content == other.content &&
          this.id == other.id &&
          this.refines == other.refines &&
          this.property == other.property &&
          this.scheme == other.scheme);

  @override
  String toString() =>
      "EpubMetadataMeta { $name, $content, $id, $refines, $property, $scheme }";
}

class EpubMetadata implements ProductType {
  final List<String> titles;
  final List<EpubMetadataCreator> creators;
  final List<String> subjects;
  final String? description;
  final List<String> publishers;
  final List<EpubMetadataContributor> contributors;
  final List<EpubMetadataDate> dates;
  final List<String> types;
  final List<String> formats;
  final List<EpubMetadataIdentifier> identifiers;
  final List<String> sources;
  final List<String> languages;
  final List<String> relations;
  final List<String> coverages;
  final List<String> rights;
  final List<EpubMetadataMeta> metaItems;

  const EpubMetadata(
      this.titles,
      this.creators,
      this.subjects,
      this.description,
      this.publishers,
      this.contributors,
      this.dates,
      this.types,
      this.formats,
      this.identifiers,
      this.sources,
      this.languages,
      this.relations,
      this.coverages,
      this.rights,
      this.metaItems)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        List<String>,
        List<EpubMetadataCreator>,
        List<String>,
        Nullable<String>,
        List<String>,
        List<EpubMetadataContributor>,
        List<EpubMetadataDate>,
        List<String>,
        List<String>,
        List<EpubMetadataIdentifier>,
        List<String>,
        List<String>,
        List<String>,
        List<String>,
        List<String>,
        List<EpubMetadataMeta>
      ]);

  @override
  int get hashCode => Object.hash(
      (EpubMetadata),
      titles,
      creators,
      subjects,
      description,
      publishers,
      contributors,
      dates,
      types,
      formats,
      identifiers,
      sources,
      languages,
      relations,
      coverages,
      rights,
      metaItems);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubMetadata &&
          true &&
          this.titles == other.titles &&
          this.creators == other.creators &&
          this.subjects == other.subjects &&
          this.description == other.description &&
          this.publishers == other.publishers &&
          this.contributors == other.contributors &&
          this.dates == other.dates &&
          this.types == other.types &&
          this.formats == other.formats &&
          this.identifiers == other.identifiers &&
          this.sources == other.sources &&
          this.languages == other.languages &&
          this.relations == other.relations &&
          this.coverages == other.coverages &&
          this.rights == other.rights &&
          this.metaItems == other.metaItems);

  @override
  String toString() =>
      "EpubMetadata { $titles, $creators, $subjects, $description, $publishers, $contributors, $dates, $types, $formats, $identifiers, $sources, $languages, $relations, $coverages, $rights, $metaItems }";
}

class EpubPackage implements ProductType {
  final EpubVersion version;
  final EpubMetadata metadata;
  final EpubManifest manifest;
  final EpubSpine spine;
  final EpubGuide? guide;

  const EpubPackage(
      this.version, this.metadata, this.manifest, this.spine, this.guide)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        EpubVersion,
        EpubMetadata,
        EpubManifest,
        EpubSpine,
        Nullable<EpubGuide>
      ]);

  @override
  int get hashCode =>
      Object.hash((EpubPackage), version, metadata, manifest, spine, guide);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubPackage &&
          true &&
          this.version == other.version &&
          this.metadata == other.metadata &&
          this.manifest == other.manifest &&
          this.spine == other.spine &&
          this.guide == other.guide);

  @override
  String toString() =>
      "EpubPackage { $version, $metadata, $manifest, $spine, $guide }";
}

class EpubSpineItemRef implements ProductType {
  final String idRef;
  final bool isLinear;

  const EpubSpineItemRef(this.idRef, this.isLinear) : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([String, bool]);

  @override
  int get hashCode => Object.hash((EpubSpineItemRef), idRef, isLinear);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubSpineItemRef &&
          true &&
          this.idRef == other.idRef &&
          this.isLinear == other.isLinear);

  @override
  String toString() => "EpubSpineItemRef { $idRef, $isLinear }";
}

class EpubSpine implements ProductType {
  final String tableOfContents;
  final List<EpubSpineItemRef> items;

  const EpubSpine(this.tableOfContents, this.items) : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([String, List<EpubSpineItemRef>]);

  @override
  int get hashCode => Object.hash((EpubSpine), tableOfContents, items);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubSpine &&
          true &&
          this.tableOfContents == other.tableOfContents &&
          this.items == other.items);

  @override
  String toString() => "EpubSpine { $tableOfContents, $items }";
}
