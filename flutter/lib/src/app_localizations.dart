import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/messages_all.dart';

/// Class which encapsulates the app’s localized values.
class AppLocalization {
  static Locale locale;
  static void Function(Locale) onLocaleChange;

  /// Load a new locale [newLocale].
  static Future<AppLocalization> load(Locale newLocale) {
    locale = newLocale;
    final String name = newLocale.countryCode.isEmpty
        ? newLocale.languageCode
        : newLocale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization();
    });
  }

  /// Retrieve an instance based on the [context].
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  /// Fetch the previously saved locale using [SharedPreferences].
  static Future<Locale> fetchLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String languageCode = prefs.getString('languageCode');

    if (languageCode == null || languageCode == "") return locale;

    locale = Locale(languageCode, prefs.getString('countryCode'));
    return locale;
  }

  /// Set a new [locale] and persist it using [SharedPreferences].
  ///
  /// By default the whole app is refresh when calling this function.
  /// To avoid this behaviour, set [refresh] to true.
  static Future<void> setLocale(Locale locale, {bool refresh = true}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('languageCode', locale.languageCode);
    await prefs.setString('countryCode', locale.countryCode);

    load(locale);
    if (refresh && onLocaleChange != null) {
      onLocaleChange(locale);
    }
  }

  String get title => Intl.message('', name: 'title');
  String welcome(String newline) =>
      Intl.message('', name: 'welcome', args: [newline]);
  String get shortSummary => Intl.message('', name: 'shortSummary');
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
