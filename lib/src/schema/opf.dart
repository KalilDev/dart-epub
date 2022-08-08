// ignore_for_file: unused_element

import 'package:adt_annotation/adt_annotation.dart';
part 'opf.g.dart';

@data(
  #EpubGuideReference,
  [],
  Record(
    {
      #type: T(#String),
      #title: T.n(#String),
      #href: T(#String),
    },
  ),
)
const Type _EpubGuideReference = EpubGuideReference;

@data(
  #EpubGuide,
  [],
  Record(
    {
      #items: T(#List, args: [T(#EpubGuideReference)])
    },
  ),
)
const Type _EpubGuide = EpubGuide;

@data(
  #EpubManifestItem,
  [],
  Record(
    {
      #id: T(#String),
      #href: T(#String),
      #mediaType: T(#String),
      #requiredNamespaces: T.n(#String),
      #requiredModules: T.n(#String),
      #fallback: T.n(#String),
      #fallbackStyle: T.n(#String),
    },
  ),
)
const Type _EpubManifestItem = EpubManifestItem;

@data(
  #EpubManifest,
  [],
  Record(
    {
      #items: T(#List, args: [T(#EpubManifestItem)]),
    },
  ),
)
const Type _EpubManifest = EpubManifest;

@data(
  #EpubMetadataContributor,
  [],
  Record(
    {
      #contributor: T(#String),
      #fileAs: T.n(#String),
      #role: T.n(#String),
    },
  ),
)
const Type _EpubMetadataContributor = EpubMetadataContributor;

@data(
  #EpubMetadataCreator,
  [],
  Record(
    {
      #creator: T(#String),
      #fileAs: T.n(#String),
      #role: T.n(#String),
    },
  ),
)
const Type _EpubMetadataCreator = EpubMetadataCreator;

@data(
  #EpubMetadataDate,
  [],
  Record(
    {
      #date: T(#String),
      #event: T.n(#String),
    },
  ),
)
const Type _EpubMetadataDate = EpubMetadataDate;

@data(
  #EpubMetadataIdentifier,
  [],
  Record(
    {
      #identifier: T(#String),
      #id: T.n(#String),
      #scheme: T.n(#String),
    },
  ),
)
const Type _EpubMetadataIdentifier = EpubMetadataIdentifier;

@data(
  #EpubMetadataMeta,
  [],
  Record(
    {
      #name: T.n(#String),
      #content: T.n(#String),
      #id: T.n(#String),
      #refines: T.n(#String),
      #property: T.n(#String),
      #scheme: T.n(#String),
    },
  ),
)
const Type _EpubMetadataMeta = EpubMetadataMeta;

@data(
  #EpubMetadata,
  [],
  Record(
    {
      #titles: T(#List, args: [T(#String)]),
      #creators: T(#List, args: [T(#EpubMetadataCreator)]),
      #subjects: T(#List, args: [T(#String)]),
      #description: T.n(#String),
      #publishers: T(#List, args: [T(#String)]),
      #contributors: T(#List, args: [T(#EpubMetadataContributor)]),
      #dates: T(#List, args: [T(#EpubMetadataDate)]),
      #types: T(#List, args: [T(#String)]),
      #formats: T(#List, args: [T(#String)]),
      #identifiers: T(#List, args: [T(#EpubMetadataIdentifier)]),
      #sources: T(#List, args: [T(#String)]),
      #languages: T(#List, args: [T(#String)]),
      #relations: T(#List, args: [T(#String)]),
      #coverages: T(#List, args: [T(#String)]),
      #rights: T(#List, args: [T(#String)]),
      #metaItems: T(#List, args: [T(#EpubMetadataMeta)]),
    },
  ),
)
const Type _EpubMetadata = EpubMetadata;

@data(
  #EpubPackage,
  [],
  Record(
    {
      #version: T(#EpubVersion),
      #metadata: T(#EpubMetadata),
      #manifest: T(#EpubManifest),
      #spine: T(#EpubSpine),
      #guide: T.n(#EpubGuide),
    },
  ),
)
const Type _EpubPackage = EpubPackage;

@data(
  #EpubSpineItemRef,
  [],
  Record(
    {
      #idRef: T(#String),
      #isLinear: T(#bool),
    },
  ),
)
const Type _EpubSpineItemRef = EpubSpineItemRef;

@data(
  #EpubSpine,
  [],
  Record(
    {
      #tableOfContents: T(#String),
      #items: T(#List, args: [T(#EpubSpineItemRef)])
    },
  ),
)
const Type _EpubSpine = EpubSpine;

enum EpubVersion { Epub2, Epub3 }
