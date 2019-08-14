import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: camel_case_types
// ignore_for_file: non_constant_identifier_names

/// DO NOT MODIFY THIS FILE, CHANGES WILL BE OVERWRITTEN

abstract class I18n implements WidgetsLocalizations {
  const I18n();

  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  static I18n of(BuildContext context) =>
      Localizations.of<I18n>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  /// Get language strings for the locale
  Map<String, String> getLanguageStrings();

  /// Get a translation by given [key]
  /// If the translation does not exists, [key] will be returned
  String getTranslation(String key) {
    var languageStrings = getLanguageStrings();

    return languageStrings.containsKey(key) ? languageStrings[key] : key;
  }
}

class en extends I18n {
  en();

  @override
  Map<String, String> getLanguageStrings() => {
        'key1': 'value1',
        'key2.nestedKey1': 'nestedValue2',
        'key2.nestedKey2.nestedKey3': 'nestedValue3',
        'key2.nestedKey2.nestedKey4': 'nestedValue4',
        'key2.nestedKey5': 'nestedValue5',
      };
}

class fr extends I18n {
  fr();

  @override
  Map<String, String> getLanguageStrings() => {
        'key1': 'value1',
        'key2.nestedKey1': 'nestedValue2',
        'key2.nestedKey2.nestedKey3': 'nestedValue3',
        'key2.nestedKey2.nestedKey4': 'nestedValue4',
        'key2.nestedKey5': 'nestedValue5',
      };
}

class es extends I18n {
  es();

  @override
  Map<String, String> getLanguageStrings() => {
        'key1': 'value1',
        'key2.nestedKey1': 'nestedValue2',
        'key2.nestedKey2.nestedKey3': 'nestedValue3',
        'key2.nestedKey2.nestedKey4': 'nestedValue4',
        'key2.nestedKey5': 'nestedValue5',
      };
}

class GeneratedLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", ""),
      Locale("fr", ""),
      Locale("es", ""),
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
      case "en":
        return SynchronousFuture<WidgetsLocalizations>(en());

      case "fr":
        return SynchronousFuture<WidgetsLocalizations>(fr());

      case "es":
        return SynchronousFuture<WidgetsLocalizations>(es());

      default:
        return SynchronousFuture<WidgetsLocalizations>(en());
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
