import 'package:i18_runner/src/language_string.dart';

class LanguageStringGetter extends LanguageString {
  LanguageStringGetter(String key, String value) : super(key, value);

  String _toCamelCase(String key) {
    var parts = key.split('.');
    var newParts = [parts[0]];
    for (var value in parts.sublist(1)) {
      newParts.add("${value[0].toUpperCase()}${value.substring(1)}");
    }

    return newParts.join();
  }

  @override
  String toString() => """ get ${_toCamelCase(key)} => '${this.value}'; """;
}
