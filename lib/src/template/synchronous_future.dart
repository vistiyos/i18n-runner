class SynchronousFutureTemplate {
  String _locale;

  SynchronousFutureTemplate(this._locale);

  @override
  String toString() => """
  case "$_locale":
          return SynchronousFuture<WidgetsLocalizations>($_locale());
  """;
}
