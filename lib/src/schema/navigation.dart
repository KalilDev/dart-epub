// ignore_for_file: unused_element

import 'package:adt_annotation/adt_annotation.dart';
part 'navigation.g.dart';

@data(
  #EpubNavigationContent,
  [],
  Record(
    {
      #id: T.n(#String),
      #source: T(#String),
    },
  ),
)
const Type _EpubNavigationContent = EpubNavigationContent;

@data(
  #EpubNavigationDocAuthor,
  [],
  Record(
    {
      #authors: T(#List, args: [T(#String)]),
    },
  ),
)
const Type _EpubNavigationDocAuthor = EpubNavigationDocAuthor;

@data(
  #EpubNavigationDocTitle,
  [],
  Record(
    {
      #titles: T(#List, args: [T(#String)]),
    },
  ),
)
const Type _EpubNavigationDocTitle = EpubNavigationDocTitle;

@data(
  #EpubNavigationHeadMeta,
  [],
  Record(
    {
      #name: T(#String),
      #content: T(#String),
      #schema: T.n(#String),
    },
  ),
)
const Type _EpubNavigationHeadMeta = EpubNavigationHeadMeta;

@data(
  #EpubNavigationHead,
  [],
  Record(
    {
      #metadata: T(#List, args: [T(#EpubNavigationHeadMeta)]),
    },
  ),
)
const Type _EpubNavigationHead = EpubNavigationHead;

@data(
  #EpubNavigationLabel,
  [],
  Record(
    {
      #text: T(#String),
    },
  ),
)
const Type _EpubNavigationLabel = EpubNavigationLabel;

@data(
  #EpubNavigationList,
  [],
  Record(
    {
      #id: T.n(#String),
      #klass: T.n(#String),
      #navigationLabels: T(#List, args: [T(#EpubNavigationLabel)]),
      #navigationTargets: T(#List, args: [T(#EpubNavigationTarget)]),
    },
  ),
)
const Type _EpubNavigationList = EpubNavigationList;

@data(
  #EpubNavigationMap,
  [],
  Record(
    {
      #points: T(#List, args: [T(#EpubNavigationPoint)]),
    },
  ),
)
const Type _EpubNavigationMap = EpubNavigationMap;

@data(
  #EpubNavigationPageList,
  [],
  Record(
    {
      #targets: T(#List, args: [T(#EpubNavigationPageTarget)]),
    },
  ),
)
const Type _EpubNavigationPageList = EpubNavigationPageList;

enum EpubNavigationPageTargetType { UNDEFINED, FRONT, NORMAL, SPECIAL }

@data(
  #EpubNavigationPageTarget,
  [],
  Record(
    {
      #id: T(#String),
      #value: T.n(#String),
      #type: T(#EpubNavigationPageTargetType),
      #klass: T.n(#String),
      #playOrder: T(#String),
      #navigationLabels: T(#List, args: [T(#EpubNavigationLabel)]),
      #content: T(#EpubNavigationContent),
    },
  ),
)
const Type _EpubNavigationPageTarget = EpubNavigationPageTarget;

@data(
  #EpubNavigationPoint,
  [],
  Record(
    {
      #id: T(#String),
      #klass: T.n(#String),
      #playOrder: T(#String),
      #navigationLabels: T(#List, args: [T(#EpubNavigationLabel)]),
      #content: T(#EpubNavigationContent),
      #childNavigationPoints: T(#List, args: [T(#EpubNavigationPoint)]),
    },
  ),
)
const Type _EpubNavigationPoint = EpubNavigationPoint;

@data(
  #EpubNavigationTarget,
  [],
  Record(
    {
      #id: T(#String),
      #klass: T.n(#String),
      #value: T.n(#String),
      #playOrder: T(#String),
      #navigationLabels: T(#List, args: [T(#EpubNavigationLabel)]),
      #content: T(#EpubNavigationContent),
    },
  ),
)
const Type _EpubNavigationTarget = EpubNavigationTarget;

@data(
  #EpubNavigation,
  [],
  Record(
    {
      #head: T(#EpubNavigationHead),
      #docTitle: T(#EpubNavigationDocTitle),
      #docAuthors: T(#List, args: [T(#EpubNavigationDocAuthor)]),
      #navMap: T(#EpubNavigationMap),
      #pageList: T.n(#EpubNavigationPageList),
      #navLists: T(#List, args: [T(#EpubNavigationList)]),
    },
  ),
)
const Type _EpubNavigation = EpubNavigation;
