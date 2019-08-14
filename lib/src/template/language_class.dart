import 'package:i18_runner/src/language_string.dart';
import 'package:i18_runner/src/rows.dart';

class LanguageClassTemplate {
  final String _locale;
  final Rows<LanguageString> _languageStrings;

  LanguageClassTemplate(this._locale, this._languageStrings);

  @override
  String toString() => """
  class $_locale extends I18n {
    $_locale();
    
    @override
    Map<String, String> getLanguageStrings() => {
      $_languageStrings
    };
  }
  """;
}
