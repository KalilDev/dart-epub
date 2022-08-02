library epubreadertest;

import 'dart:math';

import 'package:epub/src/schema/opf/epub_metadata.dart';
import 'package:epub/src/schema/opf/epub_metadata_contributor.dart';
import 'package:epub/src/schema/opf/epub_metadata_creator.dart';
import 'package:epub/src/schema/opf/epub_metadata_date.dart';
import 'package:epub/src/schema/opf/epub_metadata_identifier.dart';
import 'package:epub/src/schema/opf/epub_metadata_meta.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';

main() async {
  final int length = 10;
  final RandomString randomString = new RandomString(new Random(123788));
  final RandomDataGenerator generator =
      new RandomDataGenerator(new Random(123778), length);

  var reference = generator.randomEpubMetadata();
  late EpubMetadata testMetadata;
  setUp(() async {
    testMetadata = new EpubMetadata()
      ..Contributors.addAll(reference.Contributors)
      ..Coverages.addAll(reference.Coverages)
      ..Creators.addAll(reference.Creators)
      ..Dates.addAll(reference.Dates)
      ..Description = reference.Description
      ..Formats.addAll(reference.Formats)
      ..Identifiers.addAll(reference.Identifiers)
      ..Languages.addAll(reference.Languages)
      ..MetaItems.addAll(reference.MetaItems)
      ..Publishers.addAll(reference.Publishers)
      ..Relations.addAll(reference.Relations)
      ..Rights.addAll(reference.Rights)
      ..Sources.addAll(reference.Sources)
      ..Subjects.addAll(reference.Subjects)
      ..Titles.addAll(reference.Titles)
      ..Types.addAll(reference.Types);
  });

  group("EpubMetadata", () {
    group(".equals", () {
      test("is true for equivalent objects", () async {
        expect(testMetadata, equals(reference));
      });
      test("is false when Contributors changes", () async {
        testMetadata.Contributors..clear()..add(new EpubMetadataContributor());
        expect(testMetadata, isNot(reference));
      });
      test("is false when Coverages changes", () async {
        testMetadata.Coverages..clear()..add(randomString.randomAlpha(length)];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Creators changes", () async {
        testMetadata.Creators..clear()..add(new EpubMetadataCreator());
        expect(testMetadata, isNot(reference));
      });
      test("is false when Dates changes", () async {
        testMetadata.Dates..clear()..add(new EpubMetadataDate());
        expect(testMetadata, isNot(reference));
      });
      test("is false when Description changes", () async {
        testMetadata.Description = randomString.randomAlpha(length);
        expect(testMetadata, isNot(reference));
      });
      test("is false when Formats changes", () async {
        testMetadata.Formats..clear()..add(randomString.randomAlpha(length)];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Identifiers changes", () async {
        testMetadata.Identifiers = [new EpubMetadataIdentifier()];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Languages changes", () async {
        testMetadata.Languages..clear()..add(randomString.randomAlpha(length));
        expect(testMetadata, isNot(reference));
      });
      test("is false when MetaItems changes", () async {
        testMetadata.MetaItems..clear()..add(new EpubMetadataMeta());
        expect(testMetadata, isNot(reference));
      });
      test("is false when Publishers changes", () async {
        testMetadata.Publishers ..clear()..add(randomString.randomAlpha(length));
        expect(testMetadata, isNot(reference));
      });
      test("is false when Relations changes", () async {
        testMetadata.Relations ..clear()..add(randomString.randomAlpha(length));
        expect(testMetadata, isNot(reference));
      });
      test("is false when Rights changes", () async {
        testMetadata.Rights ..clear()..add(randomString.randomAlpha(length));
        expect(testMetadata, isNot(reference));
      });
      test("is false when Sources changes", () async {
        testMetadata.Sources ..clear()..add(randomString.randomAlpha(length));
        expect(testMetadata, isNot(reference));
      });
      test("is false when Subjects changes", () async {
        testMetadata.Subjects..clear()..add(randomString.randomAlpha(length));
        expect(testMetadata, isNot(reference));
      });
      test("is false when Titles changes", () async {
        testMetadata.Titles ..clear()..add(randomString.randomAlpha(length));
        expect(testMetadata, isNot(reference));
      });
      test("is false when Types changes", () async {
        testMetadata.Types ..clear()..add(randomString.randomAlpha(length));
        expect(testMetadata, isNot(reference));
      });
    });

    group(".hashCode", () {
      test("is true for equivalent objects", () async {
        expect(testMetadata.hashCode, equals(reference.hashCode));
      });
      test("is false when Contributors changes", () async {
        testMetadata.Contributors = [new EpubMetadataContributor()];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Coverages changes", () async {
        testMetadata.Coverages = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Creators changes", () async {
        testMetadata.Creators = [new EpubMetadataCreator()];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Dates changes", () async {
        testMetadata.Dates = [new EpubMetadataDate()];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Description changes", () async {
        testMetadata.Description = randomString.randomAlpha(length);
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Formats changes", () async {
        testMetadata.Formats = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Identifiers changes", () async {
        testMetadata.Identifiers = [new EpubMetadataIdentifier()];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Languages changes", () async {
        testMetadata.Languages = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when MetaItems changes", () async {
        testMetadata.MetaItems = [new EpubMetadataMeta()];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Publishers changes", () async {
        testMetadata.Publishers = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Relations changes", () async {
        testMetadata.Relations = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Rights changes", () async {
        testMetadata.Rights = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Sources changes", () async {
        testMetadata.Sources = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Subjects changes", () async {
        testMetadata.Subjects = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Titles changes", () async {
        testMetadata.Titles = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Types changes", () async {
        testMetadata.Types = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
