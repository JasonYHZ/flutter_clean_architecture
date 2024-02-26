import 'dart:convert';
import 'dart:ui';

import 'package:flutter/src/material/app.dart';
import 'package:flutter_clean_architecture/domain/model/activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedActivityKey = 'CACHED_ACTIVITY';
const cachedThemeKey = 'CACHED_THEME';
const cachedLocaleKey = 'CACHED_LOCALE';

abstract class LocalStorage {
  Future<bool> saveActivity(
      {required String cacheKey, required Activity activity});

  String? loadActivity(String cacheKey);

  Locale loadLocale();

  ThemeMode loadTheme();

  Future<bool> saveLocale(Locale locale);

  Future<bool> saveTheme(ThemeMode themeMode);
}

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _sharedPreferences;

  LocalStorageImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  String? loadActivity(String cacheKey) {
    final cache =
        _sharedPreferences.getString('${cachedActivityKey}_$cacheKey');

    return cache;
  }

  @override
  Future<bool> saveActivity(
      {required String cacheKey, required Activity activity}) {
    final json = jsonEncode(activity);

    return _sharedPreferences.setString('${cachedActivityKey}_$cacheKey', json);
  }

  @override
  Locale loadLocale() {
    final languageCode = _sharedPreferences.getString(cachedLocaleKey);
    return Locale(languageCode ?? 'en');
  }

  @override
  ThemeMode loadTheme() {
    final themeMode = _sharedPreferences.getString(cachedThemeKey);
    switch (themeMode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Future<bool> saveLocale(Locale locale) {
    return _sharedPreferences.setString(cachedLocaleKey, locale.languageCode);
  }

  @override
  Future<bool> saveTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return _sharedPreferences.setString(cachedThemeKey, 'dark');
      case ThemeMode.light:
        return _sharedPreferences.setString(cachedThemeKey, 'light');
      case ThemeMode.system:
        return _sharedPreferences.setString(cachedThemeKey, 'system');
    }
  }
}
