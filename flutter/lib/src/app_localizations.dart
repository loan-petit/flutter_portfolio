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

  // Home page localizations.
  String get title => Intl.message('', name: 'title');
  String welcome(String newline) =>
      Intl.message('', name: 'welcome', args: [newline]);
  String get shortSummary => Intl.message('', name: 'shortSummary');
  String get homePageNavigationButtonLabel =>
      Intl.message('', name: 'homePageNavigationButtonLabel');
  String get projectsLinkIntro => Intl.message('', name: 'projectsLinkIntro');
  String get projectsLink => Intl.message('', name: 'projectsLink');
  String get servicesLinkIntro => Intl.message('', name: 'servicesLinkIntro');
  String get servicesLink => Intl.message('', name: 'servicesLink');
  String get socialLinkIntro => Intl.message('', name: 'socialLinkIntro');
  String get emailCopiedMessage => Intl.message('', name: 'emailCopiedMessage');

  // Projects localizations.
  String get showPreviewButton => Intl.message('', name: 'showPreviewButton');
  String get tryItOutButton => Intl.message('', name: 'tryItOutButton');
  String get lifetoolsName => Intl.message('', name: 'lifetoolsName');
  String get lifetoolsDescription =>
      Intl.message('', name: 'lifetoolsDescription');

  // Services localizations.
  String get servicesTitle => Intl.message('', name: 'servicesTitle');
  String get applicationDevelopmentExpertiseTitle =>
      Intl.message('', name: 'applicationDevelopmentExpertiseTitle');
  String get applicationDevelopmentExpertiseSubtitle =>
      Intl.message('', name: 'applicationDevelopmentExpertiseSubtitle');
  String get devopsExpertiseTitle =>
      Intl.message('', name: 'devopsExpertiseTitle');
  String get devopsExpertiseSubtitle =>
      Intl.message('', name: 'devopsExpertiseSubtitle');
  String get chatbotDevelopmentExpertiseTitle =>
      Intl.message('', name: 'chatbotDevelopmentExpertiseTitle');
  String get chatbotDevelopmentExpertiseSubtitle =>
      Intl.message('', name: 'chatbotDevelopmentExpertiseSubtitle');
  String get backendDevelopmentExpertiseTitle =>
      Intl.message('', name: 'backendDevelopmentExpertiseTitle');
  String get backendDevelopmentExpertiseSubtitle =>
      Intl.message('', name: 'backendDevelopmentExpertiseSubtitle');
  String get consultingExpertiseTitle =>
      Intl.message('', name: 'consultingExpertiseTitle');
  String get consultingExpertiseSubtitle =>
      Intl.message('', name: 'consultingExpertiseSubtitle');
  String get servicesDescription =>
      Intl.message('', name: 'servicesDescription');
  String get dailyAverageRate => Intl.message('', name: 'dailyAverageRate');
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
