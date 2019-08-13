import 'package:i18_runner/src/language_string.dart';
import 'package:i18_runner/src/language_string_getter.dart';
import 'package:i18_runner/src/rows.dart';

class LanguageClassTemplate {
  final String _locale;
  final Rows<LanguageString> _languageStrings;
  final Rows<LanguageStringGetter> _languageStringsGetter;

  LanguageClassTemplate(this._locale, this._languageStrings, this._languageStringsGetter);

  @override
  String toString() => """
  class $_locale extends I18n {
    const $_locale();
    
    Map<String, String> languageStrings = {
      $_languageStrings
    };
    
    $_languageStringsGetter
  }
  """;
}
