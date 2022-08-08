// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ref_entities.dart';

// **************************************************************************
// AdtGenerator
// **************************************************************************

class ConstEpubBookRefData implements ProductType {
  final Archive _epubArchive;
  final String? title;
  final String author;
  final List<String> authorList;
  final EpubSchema schema;

  const ConstEpubBookRefData(
      this._epubArchive, this.title, this.author, this.authorList, this.schema)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType(
      [Archive, Nullable<String>, String, List<String>, EpubSchema]);

  @override
  int get hashCode => Object.hash(
      (ConstEpubBookRefData), _epubArchive, title, author, authorList, schema);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is ConstEpubBookRefData &&
          true &&
          this._epubArchive == other._epubArchive &&
          this.title == other.title &&
          this.author == other.author &&
          this.authorList == other.authorList &&
          this.schema == other.schema);

  @override
  String toString() =>
      "ConstEpubBookRefData { $_epubArchive, $title, $author, $authorList, $schema }";
}

abstract class EpubContentFileRef
    with _BaseEpubContentFileRef
    implements SumType {
  const EpubContentFileRef._();
  const factory EpubContentFileRef.epubByteContentFileRef(
      EpubBookRef epubBookRef,
      String fileName,
      EpubContentType contentType,
      String contentMimeType) = EpubByteContentFileRef;
  const factory EpubContentFileRef.epubTextContentFileRef(
      EpubBookRef epubBookRef,
      String fileName,
      EpubContentType contentType,
      String contentMimeType) = EpubTextContentFileRef;

  @override
  SumRuntimeType get runtimeType =>
      SumRuntimeType([EpubByteContentFileRef, EpubTextContentFileRef]);

  R visit<R extends Object?>(
      {required R Function(EpubByteContentFileRef) epubByteContentFileRef,
      required R Function(EpubTextContentFileRef) epubTextContentFileRef});

  @override
  int get hashCode => throw UnimplementedError(
      'Each case has its own implementation of hashCode');
  bool operator ==(other) =>
      throw UnimplementedError('Each case has its own implementation of ==');

  String toString() => throw UnimplementedError(
      'Each case has its own implementation of toString');
}

class EpubByteContentFileRef extends EpubContentFileRef {
  final EpubBookRef epubBookRef;
  final String fileName;
  final EpubContentType contentType;
  final String contentMimeType;

  const EpubByteContentFileRef(
      this.epubBookRef, this.fileName, this.contentType, this.contentMimeType)
      : super._();

  @override
  int get hashCode => Object.hash((EpubByteContentFileRef), epubBookRef,
      fileName, contentType, contentMimeType);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubByteContentFileRef &&
          true &&
          this.epubBookRef == other.epubBookRef &&
          this.fileName == other.fileName &&
          this.contentType == other.contentType &&
          this.contentMimeType == other.contentMimeType);

  @override
  String toString() =>
      "EpubByteContentFileRef { $epubBookRef, $fileName, $contentType, $contentMimeType }";

  @override
  R visit<R extends Object?>(
          {required R Function(EpubByteContentFileRef) epubByteContentFileRef,
          required R Function(EpubTextContentFileRef)
              epubTextContentFileRef}) =>
      epubByteContentFileRef(this);
}

class EpubTextContentFileRef extends EpubContentFileRef {
  final EpubBookRef epubBookRef;
  final String fileName;
  final EpubContentType contentType;
  final String contentMimeType;

  const EpubTextContentFileRef(
      this.epubBookRef, this.fileName, this.contentType, this.contentMimeType)
      : super._();

  @override
  int get hashCode => Object.hash((EpubTextContentFileRef), epubBookRef,
      fileName, contentType, contentMimeType);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubTextContentFileRef &&
          true &&
          this.epubBookRef == other.epubBookRef &&
          this.fileName == other.fileName &&
          this.contentType == other.contentType &&
          this.contentMimeType == other.contentMimeType);

  @override
  String toString() =>
      "EpubTextContentFileRef { $epubBookRef, $fileName, $contentType, $contentMimeType }";

  @override
  R visit<R extends Object?>(
          {required R Function(EpubByteContentFileRef) epubByteContentFileRef,
          required R Function(EpubTextContentFileRef)
              epubTextContentFileRef}) =>
      epubTextContentFileRef(this);
}

class EpubChapterRef implements ProductType {
  final EpubTextContentFileRef epubTextContentFileRef;
  final String title;
  final String contentFileName;
  final String? anchor;
  final List<EpubChapterRef> subChapters;

  const EpubChapterRef(this.epubTextContentFileRef, this.title,
      this.contentFileName, this.anchor, this.subChapters)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        EpubTextContentFileRef,
        String,
        String,
        Nullable<String>,
        List<EpubChapterRef>
      ]);

  @override
  int get hashCode => Object.hash((EpubChapterRef), epubTextContentFileRef,
      title, contentFileName, anchor, subChapters);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubChapterRef &&
          true &&
          this.epubTextContentFileRef == other.epubTextContentFileRef &&
          this.title == other.title &&
          this.contentFileName == other.contentFileName &&
          this.anchor == other.anchor &&
          this.subChapters == other.subChapters);

  @override
  String toString() =>
      "EpubChapterRef { $epubTextContentFileRef, $title, $contentFileName, $anchor, $subChapters }";
}

class EpubContentRef implements ProductType {
  final Map<String, EpubTextContentFileRef> html;
  final Map<String, EpubTextContentFileRef> css;
  final Map<String, EpubByteContentFileRef> images;
  final Map<String, EpubByteContentFileRef> fonts;

  const EpubContentRef(this.html, this.css, this.images, this.fonts) : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        Map<String, EpubTextContentFileRef>,
        Map<String, EpubTextContentFileRef>,
        Map<String, EpubByteContentFileRef>,
        Map<String, EpubByteContentFileRef>
      ]);

  @override
  int get hashCode => Object.hash((EpubContentRef), html, css, images, fonts);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubContentRef &&
          true &&
          this.html == other.html &&
          this.css == other.css &&
          this.images == other.images &&
          this.fonts == other.fonts);

  @override
  String toString() => "EpubContentRef { $html, $css, $images, $fonts }";
}
