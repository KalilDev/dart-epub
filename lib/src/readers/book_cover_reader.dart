import 'dart:async';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:image/image.dart' as images;

import '../ref_entities.dart';
import '../entities.dart';
import '../schema/opf.dart';

class BookCoverReader {
  static Future<images.Image?> readBookCover(EpubBookRef bookRef) async {
    final metaItems = bookRef.schema.package.metadata.metaItems;
    if (metaItems.isEmpty) return null;

    final coverMetaItem = metaItems.firstWhereOrNull(
        (EpubMetadataMeta metaItem) =>
            metaItem.name != null && metaItem.name!.toLowerCase() == 'cover');
    if (coverMetaItem == null) return null;
    if (coverMetaItem.content == null || coverMetaItem.content!.isEmpty) {
      throw Exception(
          'Incorrect EPUB metadata: cover item content is missing.');
    }

    final coverManifestItem = bookRef.schema.package.manifest.items
        .firstWhereOrNull((EpubManifestItem manifestItem) =>
            manifestItem.id.toLowerCase() ==
            coverMetaItem.content!.toLowerCase());
    if (coverManifestItem == null) {
      throw Exception(
          'Incorrect EPUB manifest: item with ID = \"${coverMetaItem.content}\" is missing.');
    }

    EpubByteContentFileRef? coverImageContentFileRef;
    if (!bookRef.content.images.containsKey(coverManifestItem.href)) {
      throw Exception(
          'Incorrect EPUB manifest: item with href = \"${coverManifestItem.href}\" is missing.');
    }

    coverImageContentFileRef = bookRef.content.images[coverManifestItem.href];
    final coverImageContent =
        await coverImageContentFileRef!.readContentAsBytes();
    final retval = images.decodeImage(coverImageContent);
    return retval;
  }
}
