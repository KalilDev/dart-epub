// ignore_for_file: unused_element

import 'package:adt_annotation/adt_annotation.dart';
import 'package:epub/epub.dart';

import 'schema/navigation.dart';
import 'schema/opf.dart';
part 'entities.g.dart';

@data(
  #EpubBook,
  [],
  Record(
    {
      #title: T.n(#String),
      #author: T(#String),
      #authorList: T(#List, args: [T(#String)]),
      #schema: T(#EpubSchema),
      #content: T(#EpubContent),
      #coverImage: T.n(#Image),
      #chapters: T(#List, args: [T(#EpubChapter)]),
    },
  ),
)
const Type _EpubBook = EpubBook;

@data(
  #EpubChapter,
  [],
  Record(
    {
      #title: T(#String),
      #contentFileName: T(#String),
      #anchor: T.n(#String),
      #htmlContent: T(#String),
      #subChapters: T(#List, args: [T(#EpubChapter)]),
    },
  ),
)
const Type _EpubChapter = EpubChapter;

@data(
  #EpubContentFile,
  [],
  Union({
    #EpubByteContentFile: {
      #fileName: T(#String),
      #contentType: T(#EpubContentType),
      #contentMimeType: T(#String),
      #content: T(#List, args: [T(#int)]),
    },
    #EpubTextContentFile: {
      #fileName: T(#String),
      #contentType: T(#EpubContentType),
      #contentMimeType: T(#String),
      #content: T(#String),
    }
  }),
  mixin: [
    T(#_BaseEpubContentFile),
  ],
)
const Type _EpubContentFile = EpubContentFile;

mixin _BaseEpubContentFile {
  String get fileName;
  EpubContentType get contentType;
  String get contentMimeType;
}

enum EpubContentType {
  XHTML_1_1,
  DTBOOK,
  DTBOOK_NCX,
  OEB1_DOCUMENT,
  XML,
  CSS,
  OEB1_CSS,
  IMAGE_GIF,
  IMAGE_JPEG,
  IMAGE_PNG,
  IMAGE_SVG,
  FONT_TRUETYPE,
  FONT_OPENTYPE,
  OTHER
}

@data(
  #EpubContent,
  [],
  Record(
    {
      #html: T(#Map, args: [T(#String), T(#EpubTextContentFile)]),
      #css: T(#Map, args: [T(#String), T(#EpubTextContentFile)]),
      #images: T(#Map, args: [T(#String), T(#EpubByteContentFile)]),
      #fonts: T(#Map, args: [T(#String), T(#EpubByteContentFile)]),
    },
  ),
)
const Type _EpubContent = EpubContent;

extension EpubContentEx on EpubContent {
  Map<String, EpubContentFile> get allFiles => {
        ...html,
        ...css,
        ...images,
        ...fonts,
      };
}

@data(
  #EpubSchema,
  [],
  Record(
    {
      #package: T(#EpubPackage),
      #navigation: T.n(#EpubNavigation),
      #contentDirectoryPath: T(#String),
    },
  ),
)
const Type _EpubSchema = EpubSchema;
