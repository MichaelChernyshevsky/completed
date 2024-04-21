// ignore_for_file: lines_longer_than_80_chars, prefer_constructors_over_static_methods

import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/localization/intl/messages_all_locales.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static AppLocalizations? _current;

  static AppLocalizations get current {
    _current ??= AppLocalizations();
    return _current!;
  }

  static Future<AppLocalizations> load(Locale locale) {
    final name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      _current = instance;
      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations();
  }

  String get go => Intl.message('go');
  String get settings => Intl.message('Settings');
  String get add => Intl.message('Add');
  String get delete => Intl.message('Delete');
  String get prompts => Intl.message('Prompts');
  String get models => Intl.message('Models');
  String get goBack => Intl.message('Go back');
  String get result => Intl.message('Result');
  String get export => Intl.message('Export');
  String get goMainPAge => Intl.message('Go main page');
  String get dispose => Intl.message('Dispose');
  String get param => Intl.message('Params');
  String get generate => Intl.message('Generate');
  String get import => Intl.message('Import');

  String get addPack => Intl.message('Add Pack');
  String get addWord => Intl.message('Add Word');
  String get emptyColumn => Intl.message('Empty');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);
}
