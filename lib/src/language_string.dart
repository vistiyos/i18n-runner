class LanguageString {
  final String key;
  final String value;

  LanguageString(this.key, this.value);

  @override
  String toString() => """'${this.key}': '${this.value}',""";
}
