// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// AdtGenerator
// **************************************************************************

class EpubBook implements ProductType {
  final String? title;
  final String author;
  final List<String> authorList;
  final EpubSchema schema;
  final EpubContent content;
  final Image? coverImage;
  final List<EpubChapter> chapters;

  const EpubBook(this.title, this.author, this.authorList, this.schema,
      this.content, this.coverImage, this.chapters)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        Nullable<String>,
        String,
        List<String>,
        EpubSchema,
        EpubContent,
        Nullable<Image>,
        List<EpubChapter>
      ]);

  @override
  int get hashCode => Object.hash((EpubBook), title, author, authorList, schema,
      content, coverImage, chapters);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubBook &&
          true &&
          this.title == other.title &&
          this.author == other.author &&
          this.authorList == other.authorList &&
          this.schema == other.schema &&
          this.content == other.content &&
          this.coverImage == other.coverImage &&
          this.chapters == other.chapters);

  @override
  String toString() =>
      "EpubBook { $title, $author, $authorList, $schema, $content, $coverImage, $chapters }";
}

class EpubChapter implements ProductType {
  final String title;
  final String contentFileName;
  final String? anchor;
  final String htmlContent;
  final List<EpubChapter> subChapters;

  const EpubChapter(this.title, this.contentFileName, this.anchor,
      this.htmlContent, this.subChapters)
      : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType(
      [String, String, Nullable<String>, String, List<EpubChapter>]);

  @override
  int get hashCode => Object.hash(
      (EpubChapter), title, contentFileName, anchor, htmlContent, subChapters);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubChapter &&
          true &&
          this.title == other.title &&
          this.contentFileName == other.contentFileName &&
          this.anchor == other.anchor &&
          this.htmlContent == other.htmlContent &&
          this.subChapters == other.subChapters);

  @override
  String toString() =>
      "EpubChapter { $title, $contentFileName, $anchor, $htmlContent, $subChapters }";
}

abstract class EpubContentFile with _BaseEpubContentFile implements SumType {
  const EpubContentFile._();
  const factory EpubContentFile.epubByteContentFile(
      String fileName,
      EpubContentType contentType,
      String contentMimeType,
      List<int> content) = EpubByteContentFile;
  const factory EpubContentFile.epubTextContentFile(
      String fileName,
      EpubContentType contentType,
      String contentMimeType,
      String content) = EpubTextContentFile;

  @override
  SumRuntimeType get runtimeType =>
      SumRuntimeType([EpubByteContentFile, EpubTextContentFile]);

  R visit<R extends Object?>(
      {required R Function(EpubByteContentFile) epubByteContentFile,
      required R Function(EpubTextContentFile) epubTextContentFile});

  @override
  int get hashCode => throw UnimplementedError(
      'Each case has its own implementation of hashCode');
  bool operator ==(other) =>
      throw UnimplementedError('Each case has its own implementation of ==');

  String toString() => throw UnimplementedError(
      'Each case has its own implementation of toString');
}

class EpubByteContentFile extends EpubContentFile {
  final String fileName;
  final EpubContentType contentType;
  final String contentMimeType;
  final List<int> content;

  const EpubByteContentFile(
      this.fileName, this.contentType, this.contentMimeType, this.content)
      : super._();

  @override
  int get hashCode => Object.hash(
      (EpubByteContentFile), fileName, contentType, contentMimeType, content);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubByteContentFile &&
          true &&
          this.fileName == other.fileName &&
          this.contentType == other.contentType &&
          this.contentMimeType == other.contentMimeType &&
          this.content == other.content);

  @override
  String toString() =>
      "EpubByteContentFile { $fileName, $contentType, $contentMimeType, $content }";

  @override
  R visit<R extends Object?>(
          {required R Function(EpubByteContentFile) epubByteContentFile,
          required R Function(EpubTextContentFile) epubTextContentFile}) =>
      epubByteContentFile(this);
}

class EpubTextContentFile extends EpubContentFile {
  final String fileName;
  final EpubContentType contentType;
  final String contentMimeType;
  final String content;

  const EpubTextContentFile(
      this.fileName, this.contentType, this.contentMimeType, this.content)
      : super._();

  @override
  int get hashCode => Object.hash(
      (EpubTextContentFile), fileName, contentType, contentMimeType, content);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubTextContentFile &&
          true &&
          this.fileName == other.fileName &&
          this.contentType == other.contentType &&
          this.contentMimeType == other.contentMimeType &&
          this.content == other.content);

  @override
  String toString() =>
      "EpubTextContentFile { $fileName, $contentType, $contentMimeType, $content }";

  @override
  R visit<R extends Object?>(
          {required R Function(EpubByteContentFile) epubByteContentFile,
          required R Function(EpubTextContentFile) epubTextContentFile}) =>
      epubTextContentFile(this);
}

class EpubContent implements ProductType {
  final Map<String, EpubTextContentFile> html;
  final Map<String, EpubTextContentFile> css;
  final Map<String, EpubByteContentFile> images;
  final Map<String, EpubByteContentFile> fonts;

  const EpubContent(this.html, this.css, this.images, this.fonts) : super();

  @override
  ProductRuntimeType get runtimeType => ProductRuntimeType([
        Map<String, EpubTextContentFile>,
        Map<String, EpubTextContentFile>,
        Map<String, EpubByteContentFile>,
        Map<String, EpubByteContentFile>
      ]);

  @override
  int get hashCode => Object.hash((EpubContent), html, css, images, fonts);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubContent &&
          true &&
          this.html == other.html &&
          this.css == other.css &&
          this.images == other.images &&
          this.fonts == other.fonts);

  @override
  String toString() => "EpubContent { $html, $css, $images, $fonts }";
}

class EpubSchema implements ProductType {
  final EpubPackage package;
  final EpubNavigation? navigation;
  final String contentDirectoryPath;

  const EpubSchema(this.package, this.navigation, this.contentDirectoryPath)
      : super();

  @override
  ProductRuntimeType get runtimeType =>
      ProductRuntimeType([EpubPackage, Nullable<EpubNavigation>, String]);

  @override
  int get hashCode =>
      Object.hash((EpubSchema), package, navigation, contentDirectoryPath);
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is EpubSchema &&
          true &&
          this.package == other.package &&
          this.navigation == other.navigation &&
          this.contentDirectoryPath == other.contentDirectoryPath);

  @override
  String toString() =>
      "EpubSchema { $package, $navigation, $contentDirectoryPath }";
}
