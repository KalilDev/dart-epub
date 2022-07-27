import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_metadata_contributor.dart';
import 'epub_metadata_creator.dart';
import 'epub_metadata_date.dart';
import 'epub_metadata_identifier.dart';
import 'epub_metadata_meta.dart';

class EpubMetadata {
  /* late final */ List<String> Titles;
  /* late final */ List<EpubMetadataCreator> Creators;
  /* late final */ List<String> Subjects;
  /* late final */ String Description;
  /* late final */ List<String> Publishers;
  /* late final */ List<EpubMetadataContributor> Contributors;
  /* late final */ List<EpubMetadataDate> Dates;
  /* late final */ List<String> Types;
  /* late final */ List<String> Formats;
  /* late final */ List<EpubMetadataIdentifier> Identifiers;
  /* late final */ List<String> Sources;
  /* late final */ List<String> Languages;
  /* late final */ List<String> Relations;
  /* late final */ List<String> Coverages;
  /* late final */ List<String> Rights;
  /* late final */ List<EpubMetadataMeta> MetaItems;

  @override
  int get hashCode {
    var objects = [
      ...Titles.map((title) => title.hashCode),
      ...Creators.map((creator) => creator.hashCode),
      ...Subjects.map((subject) => subject.hashCode),
      ...Publishers.map((publisher) => publisher.hashCode),
      ...Contributors.map((contributor) => contributor.hashCode),
      ...Dates.map((date) => date.hashCode),
      ...Types.map((type) => type.hashCode),
      ...Formats.map((format) => format.hashCode),
      ...Identifiers.map((identifier) => identifier.hashCode),
      ...Sources.map((source) => source.hashCode),
      ...Languages.map((language) => language.hashCode),
      ...Relations.map((relation) => relation.hashCode),
      ...Coverages.map((coverage) => coverage.hashCode),
      ...Rights.map((right) => right.hashCode),
      ...MetaItems.map((metaItem) => metaItem.hashCode),
      Description.hashCode
    ];

    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    var otherAs = other as EpubMetadata;
    if (otherAs == null) return false;
    if (Description != otherAs.Description) return false;

    if (!collections.listsEqual(Titles, otherAs.Titles) ||
        !collections.listsEqual(Creators, otherAs.Creators) ||
        !collections.listsEqual(Subjects, otherAs.Subjects) ||
        !collections.listsEqual(Publishers, otherAs.Publishers) ||
        !collections.listsEqual(Contributors, otherAs.Contributors) ||
        !collections.listsEqual(Dates, otherAs.Dates) ||
        !collections.listsEqual(Types, otherAs.Types) ||
        !collections.listsEqual(Formats, otherAs.Formats) ||
        !collections.listsEqual(Identifiers, otherAs.Identifiers) ||
        !collections.listsEqual(Sources, otherAs.Sources) ||
        !collections.listsEqual(Languages, otherAs.Languages) ||
        !collections.listsEqual(Relations, otherAs.Relations) ||
        !collections.listsEqual(Coverages, otherAs.Coverages) ||
        !collections.listsEqual(Rights, other.Rights) ||
        !collections.listsEqual(MetaItems, other.MetaItems)) {
      return false;
    }

    return true;
  }
}
