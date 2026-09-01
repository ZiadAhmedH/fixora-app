import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:feild_service_app/l10n/app_localizations.dart';

/// All supported locales for the app.
const List<Locale> appSupportedLocales = [
  Locale('en'), // English
  Locale('ar'), // Arabic
];

/// Localization delegates to pass to [MaterialApp.localizationsDelegates].
const List<LocalizationsDelegate<dynamic>> appLocalizationDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

/// Returns the [TextDirection] for a given locale.
TextDirection textDirectionForLocale(Locale locale) {
  switch (locale.languageCode) {
    case 'ar':
    case 'he':
    case 'fa':
    case 'ur':
      return TextDirection.rtl;
    default:
      return TextDirection.ltr;
  }
}
