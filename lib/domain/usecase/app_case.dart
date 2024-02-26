import 'package:flutter/material.dart';

import '../repository/app.dart';

class AppCase {
  final AppRepository _appRepository;

  AppCase(this._appRepository);

  Future<bool> saveTheme(ThemeMode themeMode) async {
    return _appRepository.saveTheme(themeMode);
  }

  Future<bool> saveLocale(Locale locale) async {
    return _appRepository.saveLocale(locale);
  }

  ThemeMode loadTheme() {
    return _appRepository.loadTheme();
  }

  Locale loadLocale() {
    return _appRepository.loadLocale();
  }
}
