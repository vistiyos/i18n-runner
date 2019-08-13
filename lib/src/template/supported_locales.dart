class SupportedLocalesTemplate {
  String _locale;

  SupportedLocalesTemplate(this._locale);

  @override
  String toString() => """
    Locale("$_locale", ""),
  """;
}
