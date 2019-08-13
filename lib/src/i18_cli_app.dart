// TODO: Put public facing types in this file.

import 'dart:io';

import 'package:args/args.dart';
import 'package:i18_runner/src/generators/base_generator.dart';
import 'package:i18_runner/src/generators/i18n_generator.dart';
import 'package:i18_runner/src/generators/language_file_generator.dart';
import 'package:i18_runner/src/generators/template_generator.dart';

class I18nCliApp {
  final List<String> _availableFormats = ['json', 'arb'];
  final List<String> _availableCommands = ['generateLangFiles', 'generateI18n'];

  void process(List<String> args) {
    var argParser = _createArgParser();
    ArgResults options;

    try {
      options = argParser.parse(args);
    } on FormatException catch (ex) {
      stdout.writeln(ex.message);
      exit(2);
    }

    I18nGenerator i18Generator;

    if (options.rest.isEmpty || !_availableCommands.contains(options.rest[0])) {
      i18Generator = BaseGenerator();
    } else {
      if (!options.wasParsed('output')) throw ArgumentError('output argument is required');
      switch (options.rest[0]) {
        case 'generateLangFiles':
          i18Generator = LanguageFileGenerator(options['format'], Directory(options['output']));
          break;
        case 'generateI18n':
          if (!options.wasParsed('input')) throw ArgumentError('input argument is required');
          i18Generator =
              TemplateGenerator(Directory(options['input']), Directory(options['output']));
          break;
      }
    }

    i18Generator.generate();
  }

  ArgParser _createArgParser() => ArgParser() //
    ..addOption('format', abbr: 'f', defaultsTo: 'json', allowed: _availableFormats)
    ..addOption('input', abbr: 'i', help: 'Input directory to read from')
    ..addOption('output', abbr: 'o', help: 'Output directory');
}
