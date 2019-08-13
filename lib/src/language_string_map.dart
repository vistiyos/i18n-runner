import 'package:i18_runner/src/language_string.dart';
import 'package:i18_runner/src/language_string_getter.dart';
import 'package:i18_runner/src/rows.dart';

/// Holds the information about language strings
class LanguageStringMap {
  Map<String, Rows<LanguageString>> _languageStrings = {};

  void addLanguageStrings(String locale, Map<String, String> languageStrings) {
    Rows<LanguageString> languageStringList = Rows();
    languageStrings.forEach((key, value) => languageStringList.add(LanguageString(key, value)));
    _languageStrings[locale] = languageStringList;
  }

  Rows<LanguageString> getLanguageStrings(String locale) =>
      _languageStrings.containsKey(locale) ? _languageStrings[locale] : Rows();

  Rows<LanguageStringGetter> getLanguageStringsGetter(String locale) {
    Rows<LanguageString> languageStrings =
        _languageStrings.containsKey(locale) ? _languageStrings[locale] : Rows();
    var result = Rows<LanguageStringGetter>();
    languageStrings.forEach((languageString) =>
        result.add(LanguageStringGetter(languageString.key, languageString.value)));

    return result;
  }
}
