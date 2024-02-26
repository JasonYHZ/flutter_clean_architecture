import 'package:flutter/material.dart';

abstract class AppRepository {
  Future<bool> saveTheme(ThemeMode themeMode);

  Future<bool> saveLocale(Locale locale);

  ThemeMode loadTheme();

  Locale loadLocale();
}
