class EpubNavigationLabel {
  late final String Text;

  @override
  int get hashCode => Text.hashCode;

  @override
  bool operator ==(other) {
    var otherAs = other as EpubNavigationLabel;
    return Text == otherAs.Text;
  }

  @override
  String toString() {
    return Text;
  }
}
