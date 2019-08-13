import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:i18_runner/src/generators/i18n_generator.dart';
import 'package:i18_runner/src/language_file.dart';
import 'package:i18_runner/src/language_string_map.dart';
import 'package:i18_runner/src/template/i18n.dart';
import 'package:tuple/tuple.dart';

class TemplateGenerator extends I18nGenerator {
  final Directory _inputDirectory;
  final Directory _outputDirectory;
  final RegExp _languageFileRegExp = RegExp(r"string_(.*)\.json$");

  TemplateGenerator(this._inputDirectory, this._outputDirectory);

  Future generate() async {
    return _getLanguageFiles().then((languageFiles) {
      var path = "${_outputDirectory.path}/i18n.dart";
      File(path) //
        ..createSync()
        ..writeAsStringSync(
          I18nTemplate(_getAllLocales(languageFiles), _getLanguageStrings(languageFiles))
              .toString(),
        )
        ..writeAsStringSync(Process.runSync('dartfmt', [File(path).absolute.path]).stdout);
    });
  }

  /// Get a list of [LanguageFile] from given input folder.
  Future<List<LanguageFile>> _getLanguageFiles() {
    List<LanguageFile> languageFiles = [];
    var languageFilesFuture = Completer<List<LanguageFile>>();

    _inputDirectory //
        .list()
        .toList()
        .then((files) {
      files.forEach((item) {
        var match = _languageFileRegExp.firstMatch(item.path);
        if (match != null && match.groupCount > 0) {
          languageFiles.add(LanguageFile(match.group(1), item));
        }
      });

      languageFilesFuture.complete(languageFiles);
    });

    return languageFilesFuture.future;
  }

  LanguageStringMap _getLanguageStrings(List<LanguageFile> languageFiles) {
    LanguageStringMap languageStrings = LanguageStringMap();

    languageFiles.forEach((languageFile) => //
        languageStrings.addLanguageStrings(
          languageFile.locale,
          _parseLanguageFileContent(json.decode(File(languageFile.file.path) //
              .readAsStringSync())),
        ));

    return languageStrings;
  }

  Map<String, String> _parseLanguageFileContent(Map<String, dynamic> languageFileJsonContent) {
    final Map<String, String> languageStrings = {};
    languageFileJsonContent.forEach((key, value) {
      if (value is Map) {
        _nestedMap(key, value).forEach((tuple) => languageStrings[tuple.item1] = tuple.item2);
      } else {
        languageStrings[key] = value;
      }
    });
    return languageStrings;
  }

  List<Tuple2<String, String>> _nestedMap(String baseKey, dynamic element) {
    if (element is String) {
      return [Tuple2<String, String>(baseKey, element)];
    } else {
      List<Tuple2<String, String>> tuples = [];
      (element as Map).forEach((key, value) {
        _nestedMap(key, value)
            .forEach((tuple) => tuples.add(Tuple2("$baseKey.${tuple.item1}", tuple.item2)));
      });
      return tuples;
    }
  }

  List<String> _getAllLocales(List<LanguageFile> languageFiles) {
    List<String> locales = [];
    languageFiles.forEach((languageFile) => locales.add(languageFile.locale));

    return locales;
  }
}
