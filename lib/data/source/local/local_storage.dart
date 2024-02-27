import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/entity/user_dto.dart';
import 'package:flutter_clean_architecture/domain/model/activity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedActivityKey = 'CACHED_ACTIVITY';
const cachedThemeKey = 'CACHED_THEME';
const cachedLocaleKey = 'CACHED_LOCALE';
const cachedToken = 'CACHED_TOKEN';
const cacheUserInfo = 'CACHED_USERINFO';

abstract class LocalStorage {
  Future<bool> saveActivity(
      {required String cacheKey, required Activity activity});

  String? loadActivity(String cacheKey);

  Locale loadLocale();

  ThemeMode loadTheme();

  Future<bool> saveLocale(Locale locale);

  Future<bool> saveTheme(ThemeMode themeMode);

  Future<bool> safeSaveToken(String token);

  Future<bool> deleteToken();

  Future<bool> deleteUser();

  Future<bool> saveUser(UserDto response);

  String? loadUser();

  Future<String?> safeLoadToken();
}

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _sharedPreferences;
  final FlutterSecureStorage _secureStorage;

  LocalStorageImpl({
    required SharedPreferences sharedPreferences,
    required FlutterSecureStorage secureStorage,
  })  : _sharedPreferences = sharedPreferences,
        _secureStorage = secureStorage;

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

  @override
  Future<bool> safeSaveToken(String token) async {
    await _secureStorage.write(key: cachedToken, value: token);
    return true;
  }

  @override
  Future<bool> deleteToken() async {
    await _secureStorage.delete(key: cachedToken);
    return true;
  }

  @override
  Future<bool> deleteUser() async {
    return await _sharedPreferences.remove(cacheUserInfo);
  }

  @override
  Future<bool> saveUser(UserDto response) async {
    return await _sharedPreferences.setString(
        cacheUserInfo, jsonEncode(response));
  }

  @override
  String? loadUser() => _sharedPreferences.getString(cacheUserInfo);

  @override
  Future<String?> safeLoadToken() async {
    return await _secureStorage.read(key: cachedToken);
  }
}
