import '../ref_entities.dart';
import '../schema/navigation.dart';

class ChapterReader {
  static List<EpubChapterRef> getChapters(EpubBookRef bookRef) {
    if (bookRef.schema.navigation == null) {
      return [];
    }
    return getChaptersImpl(bookRef, bookRef.schema.navigation!.navMap.points);
  }

  static List<EpubChapterRef> getChaptersImpl(
      EpubBookRef bookRef, List<EpubNavigationPoint> navigationPoints) {
    final result = <EpubChapterRef>[];
    navigationPoints.forEach((EpubNavigationPoint navigationPoint) {
      String contentFileName;
      String? anchor;
      final contentSourceAnchorCharIndex =
          navigationPoint.content.source.indexOf('#');
      if (contentSourceAnchorCharIndex == -1) {
        contentFileName = navigationPoint.content.source;
        anchor = null;
      } else {
        contentFileName = navigationPoint.content.source
            .substring(0, contentSourceAnchorCharIndex);
        anchor = navigationPoint.content.source
            .substring(contentSourceAnchorCharIndex + 1);
      }
      contentFileName = Uri.decodeFull(contentFileName);
      if (!bookRef.content.html.containsKey(contentFileName)) {
        throw Exception(
            'Incorrect EPUB manifest: item with href = \"$contentFileName\" is missing.');
      }

      final htmlContentFileRef = bookRef.content.html[contentFileName]!;
      final chapterRef = EpubChapterRef(
        htmlContentFileRef,
        navigationPoint.navigationLabels.first.text,
        contentFileName,
        anchor,
        getChaptersImpl(bookRef, navigationPoint.childNavigationPoints),
      );

      result.add(chapterRef);
    });
    return result;
  }
}
