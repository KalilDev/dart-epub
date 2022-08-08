// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation.dart';

// **************************************************************************
// AdtGenerator
// **************************************************************************

class EpubNavigationContent implements ProductType {
  final String? id;
  final String source;

  const EpubNavigationContent(this.id, this.source) : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([Nullable<String>, String]);

  @override
  int get hashCode => Object.hash((EpubNavigationContent), id, source);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigationContent &&
          true &&
          this.id == other.id &&
          this.source == other.source);

  @override
  String toString() => "EpubNavigationContent { $id, $source }";
}

class EpubNavigationDocAuthor implements ProductType {
  final List<String> authors;

  const EpubNavigationDocAuthor(this.authors) : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([List<String>]);

  @override
  int get hashCode => Object.hash((EpubNavigationDocAuthor), authors);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigationDocAuthor &&
          true &&
          this.authors == other.authors);

  @override
  String toString() => "EpubNavigationDocAuthor { $authors }";
}

class EpubNavigationDocTitle implements ProductType {
  final List<String> titles;

  const EpubNavigationDocTitle(this.titles) : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([List<String>]);

  @override
  int get hashCode => Object.hash((EpubNavigationDocTitle), titles);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigationDocTitle && true && this.titles == other.titles);

  @override
  String toString() => "EpubNavigationDocTitle { $titles }";
}

class EpubNavigationHeadMeta implements ProductType {
  final String name;
  final String content;
  final String? schema;

  const EpubNavigationHeadMeta(this.name, this.content, this.schema) : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([String, String, Nullable<String>]);

  @override
  int get hashCode =>
      Object.hash((EpubNavigationHeadMeta), name, content, schema);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigationHeadMeta &&
          true &&
          this.name == other.name &&
          this.content == other.content &&
          this.schema == other.schema);

  @override
  String toString() => "EpubNavigationHeadMeta { $name, $content, $schema }";
}

class EpubNavigationHead implements ProductType {
  final List<EpubNavigationHeadMeta> metadata;

  const EpubNavigationHead(this.metadata) : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([List<EpubNavigationHeadMeta>]);

  @override
  int get hashCode => Object.hash((EpubNavigationHead), metadata);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigationHead && true && this.metadata == other.metadata);

  @override
  String toString() => "EpubNavigationHead { $metadata }";
}

class EpubNavigationLabel implements ProductType {
  final String text;

  const EpubNavigationLabel(this.text) : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([String]);

  @override
  int get hashCode => Object.hash((EpubNavigationLabel), text);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigationLabel && true && this.text == other.text);

  @override
  String toString() => "EpubNavigationLabel { $text }";
}

class EpubNavigationList implements ProductType {
  final String? id;
  final String? klass;
  final List<EpubNavigationLabel> navigationLabels;
  final List<EpubNavigationTarget> navigationTargets;

  const EpubNavigationList(
      this.id, this.klass, this.navigationLabels, this.navigationTargets)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        Nullable<String>,
        Nullable<String>,
        List<EpubNavigationLabel>,
        List<EpubNavigationTarget>
      ]);

  @override
  int get hashCode => Object.hash(
      (EpubNavigationList), id, klass, navigationLabels, navigationTargets);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigationList &&
          true &&
          this.id == other.id &&
          this.klass == other.klass &&
          this.navigationLabels == other.navigationLabels &&
          this.navigationTargets == other.navigationTargets);

  @override
  String toString() =>
      "EpubNavigationList { $id, $klass, $navigationLabels, $navigationTargets }";
}

class EpubNavigationMap implements ProductType {
  final List<EpubNavigationPoint> points;

  const EpubNavigationMap(this.points) : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([List<EpubNavigationPoint>]);

  @override
  int get hashCode => Object.hash((EpubNavigationMap), points);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigationMap && true && this.points == other.points);

  @override
  String toString() => "EpubNavigationMap { $points }";
}

class EpubNavigationPageList implements ProductType {
  final List<EpubNavigationPageTarget> targets;

  const EpubNavigationPageList(this.targets) : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([List<EpubNavigationPageTarget>]);

  @override
  int get hashCode => Object.hash((EpubNavigationPageList), targets);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigationPageList &&
          true &&
          this.targets == other.targets);

  @override
  String toString() => "EpubNavigationPageList { $targets }";
}

class EpubNavigationPageTarget implements ProductType {
  final String id;
  final String? value;
  final EpubNavigationPageTargetType type;
  final String? klass;
  final String playOrder;
  final List<EpubNavigationLabel> navigationLabels;
  final EpubNavigationContent content;

  const EpubNavigationPageTarget(this.id, this.value, this.type, this.klass,
      this.playOrder, this.navigationLabels, this.content)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        String,
        Nullable<String>,
        EpubNavigationPageTargetType,
        Nullable<String>,
        String,
        List<EpubNavigationLabel>,
        EpubNavigationContent
      ]);

  @override
  int get hashCode => Object.hash((EpubNavigationPageTarget), id, value, type,
      klass, playOrder, navigationLabels, content);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigationPageTarget &&
          true &&
          this.id == other.id &&
          this.value == other.value &&
          this.type == other.type &&
          this.klass == other.klass &&
          this.playOrder == other.playOrder &&
          this.navigationLabels == other.navigationLabels &&
          this.content == other.content);

  @override
  String toString() =>
      "EpubNavigationPageTarget { $id, $value, $type, $klass, $playOrder, $navigationLabels, $content }";
}

class EpubNavigationPoint implements ProductType {
  final String id;
  final String? klass;
  final String playOrder;
  final List<EpubNavigationLabel> navigationLabels;
  final EpubNavigationContent content;
  final List<EpubNavigationPoint> childNavigationPoints;

  const EpubNavigationPoint(this.id, this.klass, this.playOrder,
      this.navigationLabels, this.content, this.childNavigationPoints)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        String,
        Nullable<String>,
        String,
        List<EpubNavigationLabel>,
        EpubNavigationContent,
        List<EpubNavigationPoint>
      ]);

  @override
  int get hashCode => Object.hash((EpubNavigationPoint), id, klass, playOrder,
      navigationLabels, content, childNavigationPoints);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigationPoint &&
          true &&
          this.id == other.id &&
          this.klass == other.klass &&
          this.playOrder == other.playOrder &&
          this.navigationLabels == other.navigationLabels &&
          this.content == other.content &&
          this.childNavigationPoints == other.childNavigationPoints);

  @override
  String toString() =>
      "EpubNavigationPoint { $id, $klass, $playOrder, $navigationLabels, $content, $childNavigationPoints }";
}

class EpubNavigationTarget implements ProductType {
  final String id;
  final String? klass;
  final String? value;
  final String playOrder;
  final List<EpubNavigationLabel> navigationLabels;
  final EpubNavigationContent content;

  const EpubNavigationTarget(this.id, this.klass, this.value, this.playOrder,
      this.navigationLabels, this.content)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        String,
        Nullable<String>,
        Nullable<String>,
        String,
        List<EpubNavigationLabel>,
        EpubNavigationContent
      ]);

  @override
  int get hashCode => Object.hash((EpubNavigationTarget), id, klass, value,
      playOrder, navigationLabels, content);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigationTarget &&
          true &&
          this.id == other.id &&
          this.klass == other.klass &&
          this.value == other.value &&
          this.playOrder == other.playOrder &&
          this.navigationLabels == other.navigationLabels &&
          this.content == other.content);

  @override
  String toString() =>
      "EpubNavigationTarget { $id, $klass, $value, $playOrder, $navigationLabels, $content }";
}

class EpubNavigation implements ProductType {
  final EpubNavigationHead head;
  final EpubNavigationDocTitle docTitle;
  final List<EpubNavigationDocAuthor> docAuthors;
  final EpubNavigationMap navMap;
  final EpubNavigationPageList? pageList;
  final List<EpubNavigationList> navLists;

  const EpubNavigation(this.head, this.docTitle, this.docAuthors, this.navMap,
      this.pageList, this.navLists)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        EpubNavigationHead,
        EpubNavigationDocTitle,
        List<EpubNavigationDocAuthor>,
        EpubNavigationMap,
        Nullable<EpubNavigationPageList>,
        List<EpubNavigationList>
      ]);

  @override
  int get hashCode => Object.hash(
      (EpubNavigation), head, docTitle, docAuthors, navMap, pageList, navLists);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubNavigation &&
          true &&
          this.head == other.head &&
          this.docTitle == other.docTitle &&
          this.docAuthors == other.docAuthors &&
          this.navMap == other.navMap &&
          this.pageList == other.pageList &&
          this.navLists == other.navLists);

  @override
  String toString() =>
      "EpubNavigation { $head, $docTitle, $docAuthors, $navMap, $pageList, $navLists }";
}
