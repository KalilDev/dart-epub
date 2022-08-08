import '../schema/opf.dart';
import 'package:xml/src/xml/builder.dart' show XmlBuilder;

class EpubGuideWriter {
  static void writeGuide(XmlBuilder builder, EpubGuide guide) {
    builder.element('guide', nest: () {
      guide.items
          .forEach((guideItem) => builder.element('reference', attributes: {
                'type': guideItem.type,
                if (guideItem.title != null) 'title': guideItem.title!,
                'href': guideItem.href
              }));
    });
  }
}
