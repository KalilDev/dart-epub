import 'dart:async';

import 'package:archive/archive.dart';
import 'dart:convert' as convert;
import 'package:collection/collection.dart' show IterableExtension;
import 'package:xml/xml.dart' as xml;

import '../schema/navigation.dart';
import '../schema/opf.dart';
import '../utils/enum_from_string.dart';
import '../utils/zip_path_utils.dart';

class NavigationReader {
  static Future<EpubNavigation?> readNavigation(Archive epubArchive,
      String contentDirectoryPath, EpubPackage package) async {
    final tocId = package.spine.tableOfContents;
    if (tocId.isEmpty) {
      if (package.version == EpubVersion.Epub2) {
        throw Exception('EPUB parsing error: TOC ID is empty.');
      }
      return null;
    }

    final tocManifestItem = package.manifest.items.firstWhereOrNull(
        (EpubManifestItem item) =>
            item.id.toLowerCase() == tocId.toLowerCase());
    if (tocManifestItem == null) {
      throw Exception(
          'EPUB parsing error: TOC item $tocId not found in EPUB manifest.');
    }

    final tocFileEntryPath =
        ZipPathUtils.combine(contentDirectoryPath, tocManifestItem.href);
    final tocFileEntry = epubArchive.files.firstWhereOrNull(
        (ArchiveFile file) =>
            file.name.toLowerCase() == tocFileEntryPath.toLowerCase());
    if (tocFileEntry == null) {
      throw Exception(
          'EPUB parsing error: TOC file $tocFileEntryPath not found in archive.');
    }

    final containerDocument =
        xml.XmlDocument.parse(convert.utf8.decode(tocFileEntry.content));

    final ncxNamespace = 'http://www.daisy.org/z3986/2005/ncx/';
    final ncxNode = containerDocument
        .findAllElements('ncx', namespace: ncxNamespace)
        .firstOrNull;
    if (ncxNode == null) {
      throw Exception(
          'EPUB parsing error: TOC file does not contain ncx element.');
    }

    final headNode =
        ncxNode.findAllElements('head', namespace: ncxNamespace).firstOrNull;
    if (headNode == null) {
      throw Exception(
          'EPUB parsing error: TOC file does not contain head element.');
    }

    final navigationHead = readNavigationHead(headNode);
    final docTitleNode =
        ncxNode.findElements('docTitle', namespace: ncxNamespace).firstOrNull;
    if (docTitleNode == null) {
      throw Exception(
          'EPUB parsing error: TOC file does not contain docTitle element.');
    }

    final navigationDocTitle = readNavigationDocTitle(docTitleNode);
    final docAuthors = <EpubNavigationDocAuthor>[];
    ncxNode
        .findElements('docAuthor', namespace: ncxNamespace)
        .forEach((xml.XmlElement docAuthorNode) {
      docAuthors.add(readNavigationDocAuthor(docAuthorNode));
    });

    final navMapNode =
        ncxNode.findElements('navMap', namespace: ncxNamespace).firstOrNull;
    if (navMapNode == null) {
      throw Exception(
          'EPUB parsing error: TOC file does not contain navMap element.');
    }

    final navMap = readNavigationMap(navMapNode);
    final pageListNode =
        ncxNode.findElements('pageList', namespace: ncxNamespace).firstOrNull;
    final pageList =
        pageListNode != null ? readNavigationPageList(pageListNode) : null;

    final navLists = <EpubNavigationList>[];
    ncxNode
        .findElements('navList', namespace: ncxNamespace)
        .forEach((xml.XmlElement navigationListNode) {
      final navigationList = readNavigationList(navigationListNode);
      navLists.add(navigationList);
    });
    return EpubNavigation(
      navigationHead,
      navigationDocTitle,
      docAuthors,
      navMap,
      pageList,
      navLists,
    );
  }

  static EpubNavigationContent readNavigationContent(
      xml.XmlElement navigationContentNode) {
    String? id;
    var source = '';
    navigationContentNode.attributes
        .forEach((xml.XmlAttribute navigationContentNodeAttribute) {
      final attributeValue = navigationContentNodeAttribute.value;
      switch (navigationContentNodeAttribute.name.local.toLowerCase()) {
        case 'id':
          id = attributeValue;
          break;
        case 'src':
          source = attributeValue;
          break;
      }
    });
    if (source.isEmpty) {
      throw Exception(
          'Incorrect EPUB navigation content: content source is missing.');
    }

    return EpubNavigationContent(id, source);
  }

  static EpubNavigationDocAuthor readNavigationDocAuthor(
      xml.XmlElement docAuthorNode) {
    final authors = <String>[];
    docAuthorNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement textNode) {
      if (textNode.name.local.toLowerCase() == 'text') {
        authors.add(textNode.text);
      }
    });
    return EpubNavigationDocAuthor(authors);
  }

  static EpubNavigationDocTitle readNavigationDocTitle(
      xml.XmlElement docTitleNode) {
    final titles = <String>[];
    docTitleNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement textNode) {
      if (textNode.name.local.toLowerCase() == 'text') {
        titles.add(textNode.text);
      }
    });
    return EpubNavigationDocTitle(titles);
  }

  static EpubNavigationHead readNavigationHead(xml.XmlElement headNode) {
    final metadata = <EpubNavigationHeadMeta>[];

    headNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement metaNode) {
      if (metaNode.name.local.toLowerCase() == 'meta') {
        var name = '';
        var content = '';
        String? scheme;
        metaNode.attributes.forEach((xml.XmlAttribute metaNodeAttribute) {
          final attributeValue = metaNodeAttribute.value;
          switch (metaNodeAttribute.name.local.toLowerCase()) {
            case 'name':
              name = attributeValue;
              break;
            case 'content':
              content = attributeValue;
              break;
            case 'scheme':
              scheme = attributeValue;
              break;
          }
        });

        if (name.isEmpty) {
          throw Exception(
              'Incorrect EPUB navigation meta: meta name is missing.');
        }
        if (content.isEmpty) {
          throw Exception(
              'Incorrect EPUB navigation meta: meta content is missing.');
        }

        metadata.add(EpubNavigationHeadMeta(name, content, scheme));
      }
    });
    return EpubNavigationHead(metadata);
  }

  static EpubNavigationLabel readNavigationLabel(
      xml.XmlElement navigationLabelNode) {
    final navigationLabelTextNode = navigationLabelNode
        .findElements('text', namespace: navigationLabelNode.name.namespaceUri)
        .firstOrNull;
    if (navigationLabelTextNode == null) {
      throw Exception(
          'Incorrect EPUB navigation label: label text element is missing.');
    }

    return EpubNavigationLabel(navigationLabelTextNode.text);
  }

  static EpubNavigationList readNavigationList(
      xml.XmlElement navigationListNode) {
    String? id;
    String? klass;
    final navigationLabels = <EpubNavigationLabel>[];
    final navigationTargets = <EpubNavigationTarget>[];
    navigationListNode.attributes
        .forEach((xml.XmlAttribute navigationListNodeAttribute) {
      final attributeValue = navigationListNodeAttribute.value;
      switch (navigationListNodeAttribute.name.local.toLowerCase()) {
        case 'id':
          id = attributeValue;
          break;
        case 'class':
          klass = attributeValue;
          break;
      }
    });
    navigationListNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement navigationListChildNode) {
      switch (navigationListChildNode.name.local.toLowerCase()) {
        case 'navlabel':
          navigationLabels.add(readNavigationLabel(navigationListChildNode));
          break;
        case 'navtarget':
          navigationTargets.add(readNavigationTarget(navigationListChildNode));
          break;
      }
    });
    if (navigationLabels.isEmpty) {
      throw Exception(
          'Incorrect EPUB navigation page target: at least one navLabel element is required.');
    }
    return EpubNavigationList(
      id,
      klass,
      navigationLabels,
      navigationTargets,
    );
  }

  static EpubNavigationMap readNavigationMap(xml.XmlElement navigationMapNode) {
    final points = <EpubNavigationPoint>[];
    navigationMapNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement navigationPointNode) {
      if (navigationPointNode.name.local.toLowerCase() == 'navpoint') {
        points.add(readNavigationPoint(navigationPointNode));
      }
    });
    return EpubNavigationMap(points);
  }

  static EpubNavigationPageList readNavigationPageList(
      xml.XmlElement navigationPageListNode) {
    final targets = <EpubNavigationPageTarget>[];
    navigationPageListNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement pageTargetNode) {
      if (pageTargetNode.name.local == 'pageTarget') {
        targets.add(readNavigationPageTarget(pageTargetNode));
      }
    });

    return EpubNavigationPageList(targets);
  }

  static EpubNavigationPageTarget readNavigationPageTarget(
      xml.XmlElement navigationPageTargetNode) {
    var id = '';
    String? value;
    String? klass;
    var type = EpubNavigationPageTargetType.UNDEFINED;
    var playOrder = '';
    EpubNavigationContent? content;
    final navigationLabels = <EpubNavigationLabel>[];

    navigationPageTargetNode.attributes
        .forEach((xml.XmlAttribute navigationPageTargetNodeAttribute) {
      final attributeValue = navigationPageTargetNodeAttribute.value;
      switch (navigationPageTargetNodeAttribute.name.local.toLowerCase()) {
        case 'id':
          id = attributeValue;
          break;
        case 'value':
          value = attributeValue;
          break;
        case 'type':
          type = enumFromString(
                EpubNavigationPageTargetType.values,
                attributeValue.toUpperCase(),
              ) ??
              EpubNavigationPageTargetType.UNDEFINED;
          break;
        case 'class':
          klass = attributeValue;
          break;
        case 'playorder':
          playOrder = attributeValue;
          break;
      }
    });
    if (id.isEmpty) {
      throw Exception('Incorrect EPUB navigation page target: id is missing.');
    }
    if (playOrder.isEmpty) {
      throw Exception(
          'Incorrect EPUB navigation page target: playOrder is missing.');
    }
    if (type == EpubNavigationPageTargetType.UNDEFINED) {
      throw Exception(
          'Incorrect EPUB navigation page target: page target type is missing.');
    }

    navigationPageTargetNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement navigationPageTargetChildNode) {
      switch (navigationPageTargetChildNode.name.local.toLowerCase()) {
        case 'navlabel':
          navigationLabels
              .add(readNavigationLabel(navigationPageTargetChildNode));
          break;
        case 'content':
          if (content != null) {
            throw Exception(
                'Incorrect EPUB navigation target: More than one content');
          }
          content = readNavigationContent(navigationPageTargetChildNode);
          break;
      }
    });
    if (content == null) {
      throw Exception(
          'Incorrect EPUB navigation page target: content is required.');
    }
    if (navigationLabels.isEmpty) {
      throw Exception(
          'Incorrect EPUB navigation page target: at least one navLabel element is required.');
    }

    return EpubNavigationPageTarget(
      id,
      value,
      type,
      klass,
      playOrder,
      navigationLabels,
      content!,
    );
  }

  static EpubNavigationPoint readNavigationPoint(
      xml.XmlElement navigationPointNode) {
    var id = '';
    String? klass;
    var playOrder = '';
    final navigationLabels = <EpubNavigationLabel>[];
    EpubNavigationContent? content;
    final childNavigationPoints = <EpubNavigationPoint>[];
    navigationPointNode.attributes
        .forEach((xml.XmlAttribute navigationPointNodeAttribute) {
      final attributeValue = navigationPointNodeAttribute.value;
      switch (navigationPointNodeAttribute.name.local.toLowerCase()) {
        case 'id':
          id = attributeValue;
          break;
        case 'class':
          klass = attributeValue;
          break;
        case 'playorder':
          playOrder = attributeValue;
          break;
      }
    });
    if (id.isEmpty) {
      throw Exception('Incorrect EPUB navigation point: point ID is missing.');
    }
    if (playOrder.isEmpty) {
      throw Exception(
          'Incorrect EPUB navigation point: point PlayOrder is missing.');
    }

    navigationPointNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement navigationPointChildNode) {
      switch (navigationPointChildNode.name.local.toLowerCase()) {
        case 'navlabel':
          navigationLabels.add(readNavigationLabel(navigationPointChildNode));
          break;
        case 'content':
          if (content != null) {
            throw Exception(
                'Incorrect EPUB navigation target: More than one content');
          }
          content = readNavigationContent(navigationPointChildNode);
          break;
        case 'navpoint':
          childNavigationPoints
              .add(readNavigationPoint(navigationPointChildNode));
          break;
      }
    });

    if (navigationLabels.isEmpty) {
      throw Exception(
          'EPUB parsing error: navigation point $id should contain at least one navigation label.');
    }
    if (content == null) {
      throw Exception(
          'EPUB parsing error: navigation point $id should contain contents.');
    }
    return EpubNavigationPoint(id, klass, playOrder, navigationLabels, content!,
        childNavigationPoints);
  }

  static EpubNavigationTarget readNavigationTarget(
      xml.XmlElement navigationTargetNode) {
    var id = '';
    String? value;
    String? klass;
    var playOrder = '';
    final navigationLabels = <EpubNavigationLabel>[];
    EpubNavigationContent? content;
    navigationTargetNode.attributes
        .forEach((xml.XmlAttribute navigationPageTargetNodeAttribute) {
      final attributeValue = navigationPageTargetNodeAttribute.value;
      switch (navigationPageTargetNodeAttribute.name.local.toLowerCase()) {
        case 'id':
          id = attributeValue;
          break;
        case 'value':
          value = attributeValue;
          break;
        case 'class':
          klass = attributeValue;
          break;
        case 'playorder':
          playOrder = attributeValue;
          break;
      }
    });
    if (id.isEmpty) {
      throw Exception(
          'Incorrect EPUB navigation target: navigation target ID is missing.');
    }
    if (playOrder.isEmpty) {
      throw Exception(
          'Incorrect EPUB navigation target: navigation target PlayOrder is missing.');
    }

    navigationTargetNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement navigationTargetChildNode) {
      switch (navigationTargetChildNode.name.local.toLowerCase()) {
        case 'navlabel':
          navigationLabels.add(readNavigationLabel(navigationTargetChildNode));
          break;
        case 'content':
          if (content != null) {
            throw Exception(
                'Incorrect EPUB navigation target: More than one content');
          }
          content = readNavigationContent(navigationTargetChildNode);
          break;
      }
    });
    if (content == null) {
      throw Exception(
          'Incorrect EPUB navigation target: navigation point $id should contain contents.');
    }
    if (navigationLabels.isEmpty) {
      throw Exception(
          'Incorrect EPUB navigation target: at least one navLabel element is required.');
    }

    return EpubNavigationTarget(
      id,
      klass,
      value,
      playOrder,
      navigationLabels,
      content!,
    );
  }
}
