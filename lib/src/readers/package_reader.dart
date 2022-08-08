import 'dart:async';

import 'package:archive/archive.dart';
import 'dart:convert' as convert;
import 'package:xml/xml.dart' as xml;
import 'package:collection/collection.dart' show IterableExtension;
import '../schema/opf.dart';

class PackageReader {
  static EpubGuide readGuide(xml.XmlElement guideNode) {
    final items = <EpubGuideReference>[];
    guideNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement guideReferenceNode) {
      if (guideReferenceNode.name.local.toLowerCase() == 'reference') {
        var type = '';
        String? title;
        var href = '';
        guideReferenceNode.attributes
            .forEach((xml.XmlAttribute guideReferenceNodeAttribute) {
          final attributeValue = guideReferenceNodeAttribute.value;
          switch (guideReferenceNodeAttribute.name.local.toLowerCase()) {
            case 'type':
              type = attributeValue;
              break;
            case 'title':
              title = attributeValue;
              break;
            case 'href':
              href = attributeValue;
              break;
          }
        });
        if (type.isEmpty) {
          throw Exception('Incorrect EPUB guide: item type is missing');
        }
        if (href.isEmpty) {
          throw Exception('Incorrect EPUB guide: item href is missing');
        }
        items.add(EpubGuideReference(
          type,
          title,
          href,
        ));
      }
    });
    return EpubGuide(items);
  }

  static EpubManifest readManifest(xml.XmlElement manifestNode) {
    final items = <EpubManifestItem>[];
    manifestNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement manifestItemNode) {
      if (manifestItemNode.name.local.toLowerCase() == 'item') {
        var id = '';
        var href = '';
        var mediaType = '';
        String? requiredNamespaces;
        String? requiredModules;
        String? fallback;
        String? fallbackStyle;
        manifestItemNode.attributes
            .forEach((xml.XmlAttribute manifestItemNodeAttribute) {
          final attributeValue = manifestItemNodeAttribute.value;
          switch (manifestItemNodeAttribute.name.local.toLowerCase()) {
            case 'id':
              id = attributeValue;
              break;
            case 'href':
              href = attributeValue;
              break;
            case 'media-type':
              mediaType = attributeValue;
              break;
            case 'required-namespace':
              requiredNamespaces = attributeValue;
              break;
            case 'required-modules':
              requiredModules = attributeValue;
              break;
            case 'fallback':
              fallback = attributeValue;
              break;
            case 'fallback-style':
              fallbackStyle = attributeValue;
              break;
          }
        });

        if (id.isEmpty) {
          throw Exception('Incorrect EPUB manifest: item ID is missing');
        }
        if (href.isEmpty) {
          throw Exception('Incorrect EPUB manifest: item href is missing');
        }
        if (mediaType.isEmpty) {
          throw Exception(
              'Incorrect EPUB manifest: item media type is missing');
        }
        items.add(EpubManifestItem(
          id,
          href,
          mediaType,
          requiredNamespaces,
          requiredModules,
          fallback,
          fallbackStyle,
        ));
      }
    });
    return EpubManifest(items);
  }

  static EpubMetadata readMetadata(
      xml.XmlElement metadataNode, EpubVersion epubVersion) {
    final titles = <String>[];
    final creators = <EpubMetadataCreator>[];
    final subjects = <String>[];
    String? description;
    final publishers = <String>[];
    final contributors = <EpubMetadataContributor>[];
    final dates = <EpubMetadataDate>[];
    final types = <String>[];
    final formats = <String>[];
    final identifiers = <EpubMetadataIdentifier>[];
    final sources = <String>[];
    final languages = <String>[];
    final relations = <String>[];
    final coverages = <String>[];
    final rights = <String>[];
    final metaItems = <EpubMetadataMeta>[];
    metadataNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement metadataItemNode) {
      final innerText = metadataItemNode.text;
      switch (metadataItemNode.name.local.toLowerCase()) {
        case 'title':
          titles.add(innerText);
          break;
        case 'creator':
          creators.add(readMetadataCreator(metadataItemNode));
          break;
        case 'subject':
          subjects.add(innerText);
          break;
        case 'description':
          description = innerText;
          break;
        case 'publisher':
          publishers.add(innerText);
          break;
        case 'contributor':
          contributors.add(readMetadataContributor(metadataItemNode));
          break;
        case 'date':
          dates.add(readMetadataDate(metadataItemNode));
          break;
        case 'type':
          types.add(innerText);
          break;
        case 'format':
          formats.add(innerText);
          break;
        case 'identifier':
          identifiers.add(readMetadataIdentifier(metadataItemNode));
          break;
        case 'source':
          sources.add(innerText);
          break;
        case 'language':
          languages.add(innerText);
          break;
        case 'relation':
          relations.add(innerText);
          break;
        case 'coverage':
          coverages.add(innerText);
          break;
        case 'rights':
          rights.add(innerText);
          break;
        case 'meta':
          if (epubVersion == EpubVersion.Epub2) {
            final meta = readMetadataMetaVersion2(metadataItemNode);
            metaItems.add(meta);
          } else if (epubVersion == EpubVersion.Epub3) {
            final meta = readMetadataMetaVersion3(metadataItemNode);
            metaItems.add(meta);
          }
          break;
      }
    });
    return EpubMetadata(
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
      metaItems,
    );
  }

  static EpubMetadataContributor readMetadataContributor(
      xml.XmlElement metadataContributorNode) {
    String? role;
    String? fileAs;
    metadataContributorNode.attributes
        .forEach((xml.XmlAttribute metadataContributorNodeAttribute) {
      final attributeValue = metadataContributorNodeAttribute.value;
      switch (metadataContributorNodeAttribute.name.local.toLowerCase()) {
        case 'role':
          role = attributeValue;
          break;
        case 'file-as':
          fileAs = attributeValue;
          break;
      }
    });
    final contributor = metadataContributorNode.text;
    return EpubMetadataContributor(
      contributor,
      fileAs,
      role,
    );
  }

  static EpubMetadataCreator readMetadataCreator(
      xml.XmlElement metadataCreatorNode) {
    String? role;
    String? fileAs;
    metadataCreatorNode.attributes
        .forEach((xml.XmlAttribute metadataCreatorNodeAttribute) {
      final attributeValue = metadataCreatorNodeAttribute.value;
      switch (metadataCreatorNodeAttribute.name.local.toLowerCase()) {
        case 'role':
          role = attributeValue;
          break;
        case 'file-as':
          fileAs = attributeValue;
          break;
      }
    });
    final contributor = metadataCreatorNode.text;
    return EpubMetadataCreator(
      contributor,
      fileAs,
      role,
    );
  }

  static EpubMetadataDate readMetadataDate(xml.XmlElement metadataDateNode) {
    final eventAttribute = metadataDateNode.getAttribute('event',
        namespace: metadataDateNode.name.namespaceUri);
    String? event;
    if (eventAttribute != null && eventAttribute.isNotEmpty) {
      event = eventAttribute;
    }
    final date = metadataDateNode.text;
    return EpubMetadataDate(date, event);
  }

  static EpubMetadataIdentifier readMetadataIdentifier(
      xml.XmlElement metadataIdentifierNode) {
    String? id;
    String? scheme;
    metadataIdentifierNode.attributes
        .forEach((xml.XmlAttribute metadataIdentifierNodeAttribute) {
      final attributeValue = metadataIdentifierNodeAttribute.value;
      switch (metadataIdentifierNodeAttribute.name.local.toLowerCase()) {
        case 'id':
          id = attributeValue;
          break;
        case 'scheme':
          scheme = attributeValue;
          break;
      }
    });
    final identifier = metadataIdentifierNode.text;
    return EpubMetadataIdentifier(
      identifier,
      id,
      scheme,
    );
  }

  static EpubMetadataMeta readMetadataMetaVersion2(
      xml.XmlElement metadataMetaNode) {
    String? name;
    String? content;
    metadataMetaNode.attributes
        .forEach((xml.XmlAttribute metadataMetaNodeAttribute) {
      final attributeValue = metadataMetaNodeAttribute.value;
      switch (metadataMetaNodeAttribute.name.local.toLowerCase()) {
        case 'name':
          name = attributeValue;
          break;
        case 'content':
          content = attributeValue;
          break;
      }
    });
    return EpubMetadataMeta(
      name,
      content,
      null,
      null,
      null,
      null,
    );
  }

  static EpubMetadataMeta readMetadataMetaVersion3(
      xml.XmlElement metadataMetaNode) {
    String? id;
    String? refines;
    String? property;
    String? scheme;
    metadataMetaNode.attributes
        .forEach((xml.XmlAttribute metadataMetaNodeAttribute) {
      final attributeValue = metadataMetaNodeAttribute.value;
      switch (metadataMetaNodeAttribute.name.local.toLowerCase()) {
        case 'id':
          id = attributeValue;
          break;
        case 'refines':
          refines = attributeValue;
          break;
        case 'property':
          property = attributeValue;
          break;
        case 'scheme':
          scheme = attributeValue;
          break;
      }
    });
    final content = metadataMetaNode.text;
    return EpubMetadataMeta(
      null,
      content,
      id,
      refines,
      property,
      scheme,
    );
  }

  static EpubPackage readPackage(Archive epubArchive, String rootFilePath) {
    final rootFileEntry = epubArchive.files.firstWhereOrNull(
        (ArchiveFile testfile) => testfile.name == rootFilePath);
    if (rootFileEntry == null) {
      throw Exception('EPUB parsing error: root file not found in archive.');
    }
    final containerDocument =
        xml.XmlDocument.parse(convert.utf8.decode(rootFileEntry.content));
    final opfNamespace = 'http://www.idpf.org/2007/opf';
    final packageNode = containerDocument
        .findElements('package', namespace: opfNamespace)
        .first;
    final epubVersionValue = packageNode.getAttribute('version');
    final EpubVersion version;
    if (epubVersionValue == '2.0') {
      version = EpubVersion.Epub2;
    } else if (epubVersionValue == '3.0') {
      version = EpubVersion.Epub3;
    } else {
      throw Exception('Unsupported EPUB version: $epubVersionValue.');
    }

    EpubGuide? guide;
    final metadataNode = packageNode
        .findElements('metadata', namespace: opfNamespace)
        .firstOrNull;
    if (metadataNode == null) {
      throw Exception('EPUB parsing error: metadata not found in the package.');
    }
    final metadata = readMetadata(metadataNode, version);
    final manifestNode = packageNode
        .findElements('manifest', namespace: opfNamespace)
        .firstOrNull;
    if (manifestNode == null) {
      throw Exception('EPUB parsing error: manifest not found in the package.');
    }
    final manifest = readManifest(manifestNode);

    final spineNode =
        packageNode.findElements('spine', namespace: opfNamespace).firstOrNull;
    if (spineNode == null) {
      throw Exception('EPUB parsing error: spine not found in the package.');
    }
    final spine = readSpine(spineNode);
    final guideNode =
        packageNode.findElements('guide', namespace: opfNamespace).firstOrNull;
    if (guideNode != null) {
      guide = readGuide(guideNode);
    }
    return EpubPackage(
      version,
      metadata,
      manifest,
      spine,
      guide,
    );
  }

  static EpubSpine readSpine(xml.XmlElement spineNode) {
    final tableOfContents = spineNode.getAttribute('toc')!;
    final items = <EpubSpineItemRef>[];
    spineNode.children
        .whereType<xml.XmlElement>()
        .forEach((xml.XmlElement spineItemNode) {
      if (spineItemNode.name.local.toLowerCase() == 'itemref') {
        final idRefAttribute = spineItemNode.getAttribute('idref');
        if (idRefAttribute == null || idRefAttribute.isEmpty) {
          throw Exception('Incorrect EPUB spine: item ID ref is missing');
        }
        final idRef = idRefAttribute;
        final linearAttribute = spineItemNode.getAttribute('linear');
        final isLinear =
            linearAttribute == null || (linearAttribute.toLowerCase() == 'no');
        items.add(EpubSpineItemRef(idRef, isLinear));
      }
    });
    return EpubSpine(tableOfContents, items);
  }
}
