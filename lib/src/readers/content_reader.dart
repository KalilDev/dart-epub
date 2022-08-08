import '../entities.dart';
import '../ref_entities.dart';
import '../schema/opf.dart';

class ContentReader {
  static EpubContentRef parseContentMap(EpubBookRef bookRef) {
    final result = EpubContentRef({}, {}, {}, {});

    bookRef.schema.package.manifest.items
        .forEach((EpubManifestItem manifestItem) {
      final fileName = manifestItem.href;
      final contentMimeType = manifestItem.mediaType;
      final contentType = getContentTypeByContentMimeType(contentMimeType);
      switch (contentType) {
        case EpubContentType.XHTML_1_1:
        case EpubContentType.CSS:
        case EpubContentType.OEB1_DOCUMENT:
        case EpubContentType.OEB1_CSS:
        case EpubContentType.XML:
        case EpubContentType.DTBOOK:
        case EpubContentType.DTBOOK_NCX:
          final epubTextContentFile = EpubTextContentFileRef(
            bookRef,
            Uri.decodeFull(fileName),
            contentType,
            contentMimeType,
          );
          switch (contentType) {
            case EpubContentType.XHTML_1_1:
              result.html[fileName] = epubTextContentFile;
              break;
            case EpubContentType.CSS:
              result.css[fileName] = epubTextContentFile;
              break;
            case EpubContentType.DTBOOK:
            case EpubContentType.DTBOOK_NCX:
            case EpubContentType.OEB1_DOCUMENT:
            case EpubContentType.XML:
            case EpubContentType.OEB1_CSS:
            case EpubContentType.IMAGE_GIF:
            case EpubContentType.IMAGE_JPEG:
            case EpubContentType.IMAGE_PNG:
            case EpubContentType.IMAGE_SVG:
            case EpubContentType.FONT_TRUETYPE:
            case EpubContentType.FONT_OPENTYPE:
            case EpubContentType.OTHER:
              break;
          }
          result.allFiles[fileName] = epubTextContentFile;
          break;
        default:
          final epubByteContentFile = EpubByteContentFileRef(
            bookRef,
            Uri.decodeFull(fileName),
            contentType,
            contentMimeType,
          );
          switch (contentType) {
            case EpubContentType.IMAGE_GIF:
            case EpubContentType.IMAGE_JPEG:
            case EpubContentType.IMAGE_PNG:
            case EpubContentType.IMAGE_SVG:
              result.images[fileName] = epubByteContentFile;
              break;
            case EpubContentType.FONT_TRUETYPE:
            case EpubContentType.FONT_OPENTYPE:
              result.fonts[fileName] = epubByteContentFile;
              break;
            case EpubContentType.CSS:
            case EpubContentType.XHTML_1_1:
            case EpubContentType.DTBOOK:
            case EpubContentType.DTBOOK_NCX:
            case EpubContentType.OEB1_DOCUMENT:
            case EpubContentType.XML:
            case EpubContentType.OEB1_CSS:
            case EpubContentType.OTHER:
              break;
          }
          result.allFiles[fileName] = epubByteContentFile;
          break;
      }
    });
    return result;
  }

  static EpubContentType getContentTypeByContentMimeType(
      String contentMimeType) {
    switch (contentMimeType.toLowerCase()) {
      case 'application/xhtml+xml':
        return EpubContentType.XHTML_1_1;
      case 'application/x-dtbook+xml':
        return EpubContentType.DTBOOK;
      case 'application/x-dtbncx+xml':
        return EpubContentType.DTBOOK_NCX;
      case 'text/x-oeb1-document':
        return EpubContentType.OEB1_DOCUMENT;
      case 'application/xml':
        return EpubContentType.XML;
      case 'text/css':
        return EpubContentType.CSS;
      case 'text/x-oeb1-css':
        return EpubContentType.OEB1_CSS;
      case 'image/gif':
        return EpubContentType.IMAGE_GIF;
      case 'image/jpeg':
        return EpubContentType.IMAGE_JPEG;
      case 'image/png':
        return EpubContentType.IMAGE_PNG;
      case 'image/svg+xml':
        return EpubContentType.IMAGE_SVG;
      case 'font/truetype':
        return EpubContentType.FONT_TRUETYPE;
      case 'font/opentype':
        return EpubContentType.FONT_OPENTYPE;
      case 'application/vnd.ms-opentype':
        return EpubContentType.FONT_OPENTYPE;
      default:
        return EpubContentType.OTHER;
    }
  }
}
