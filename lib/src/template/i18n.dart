// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_single_quotes

import 'package:i18_runner/src/language_string_map.dart';
import 'package:i18_runner/src/rows.dart';
import 'package:i18_runner/src/template/language_class.dart';
import 'package:i18_runner/src/template/supported_locales.dart';
import 'package:i18_runner/src/template/synchronous_future.dart';

class I18nTemplate {
  final Rows<LanguageClassTemplate> _languages = Rows();
  final Rows<SupportedLocalesTemplate> _supportedLocales = Rows();
  final Rows<SynchronousFutureTemplate> _synchronousFutures = Rows();

  I18nTemplate(List<String> locales, LanguageStringMap strings) {
    locales.forEach((locale) {
      _languages.add(LanguageClassTemplate(
        locale,
        strings.getLanguageStrings(locale),
        strings.getLanguageStringsGetter(locale),
      ));
      _supportedLocales.add(SupportedLocalesTemplate(locale));
      _synchronousFutures.add(SynchronousFutureTemplate(locale));
    });
  }

  @override
  String toString() => """
  import 'dart:async';

  import 'package:flutter/foundation.dart';
  import 'package:flutter/material.dart';
  
  /// DO NOT MODIFY THIS FILE, CHANGES WILL BE OVERWRITTEN
  
  class I18n implements WidgetsLocalizations {
    const I18n();
  
    static const GeneratedLocalizationsDelegate delegate =
        GeneratedLocalizationsDelegate();
  
    static I18n of(BuildContext context) =>
        Localizations.of<I18n>(context, WidgetsLocalizations);
  
    @override
    TextDirection get textDirection => TextDirection.ltr;
    
    
  }

$_languages
  class GeneratedLocalizationsDelegate
      extends LocalizationsDelegate<WidgetsLocalizations> {
    const GeneratedLocalizationsDelegate();
  
    List<Locale> get supportedLocales {
      return const <Locale>[
      $_supportedLocales
      ];
    }
  
    LocaleResolutionCallback resolution({Locale fallback}) {
      return (Locale locale, Iterable<Locale> supported) {
        final Locale languageLocale = Locale(locale.languageCode, "");
        if (supported.contains(locale)) {
          return locale;
        } else if (supported.contains(languageLocale)) {
          return languageLocale;
        } else {
          final Locale fallbackLocale = fallback ?? supported.first;
          return fallbackLocale;
        }
      };
    }
  
    @override
    Future<WidgetsLocalizations> load(Locale locale) {
      final String lang = getLang(locale);
      switch (lang) {
      $_synchronousFutures
  
        default:
          return SynchronousFuture<WidgetsLocalizations>(const I18n());
      }
    }
  
    @override
    bool isSupported(Locale locale) => supportedLocales.contains(locale);
  
    @override
    bool shouldReload(GeneratedLocalizationsDelegate old) => false;
  }
  
  String getLang(Locale l) => l.countryCode != null && l.countryCode.isEmpty
      ? l.languageCode
      : l.toString();
  """;
}
