import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

class EpubNavigationDocAuthor {
  final List<String> Authors = [];

  @override
  int get hashCode {
    var objects = [...Authors.map((author) => author.hashCode)];
    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    var otherAs = other as EpubNavigationDocAuthor;

    return collections.listsEqual(Authors, otherAs.Authors);
  }
}
