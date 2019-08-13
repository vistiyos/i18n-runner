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

class en extends I18n {
  const en();

  Map<String, String> languageStrings = {
    'key1': 'value1',
    'key2.nestedKey1': 'nestedValue2',
    'key2.nestedKey2.nestedKey3': 'nestedValue3',
    'key2.nestedKey2.nestedKey4': 'nestedValue4',
    'key2.nestedKey5': 'nestedValue5',
  };

  get key1 => 'value1';
  get key2NestedKey1 => 'nestedValue2';
  get key2NestedKey2NestedKey3 => 'nestedValue3';
  get key2NestedKey2NestedKey4 => 'nestedValue4';
  get key2NestedKey5 => 'nestedValue5';
}

class fr extends I18n {
  const fr();

  Map<String, String> languageStrings = {
    'key1': 'value1',
    'key2.nestedKey1': 'nestedValue2',
    'key2.nestedKey2.nestedKey3': 'nestedValue3',
    'key2.nestedKey2.nestedKey4': 'nestedValue4',
    'key2.nestedKey5': 'nestedValue5',
  };

  get key1 => 'value1';
  get key2NestedKey1 => 'nestedValue2';
  get key2NestedKey2NestedKey3 => 'nestedValue3';
  get key2NestedKey2NestedKey4 => 'nestedValue4';
  get key2NestedKey5 => 'nestedValue5';
}

class es extends I18n {
  const es();

  Map<String, String> languageStrings = {
    'key1': 'value1',
    'key2.nestedKey1': 'nestedValue2',
    'key2.nestedKey2.nestedKey3': 'nestedValue3',
    'key2.nestedKey2.nestedKey4': 'nestedValue4',
    'key2.nestedKey5': 'nestedValue5',
  };

  get key1 => 'value1';
  get key2NestedKey1 => 'nestedValue2';
  get key2NestedKey2NestedKey3 => 'nestedValue3';
  get key2NestedKey2NestedKey4 => 'nestedValue4';
  get key2NestedKey5 => 'nestedValue5';
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
        return SynchronousFuture<WidgetsLocalizations>(const en());

      case "fr":
        return SynchronousFuture<WidgetsLocalizations>(const fr());

      case "es":
        return SynchronousFuture<WidgetsLocalizations>(const es());

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
