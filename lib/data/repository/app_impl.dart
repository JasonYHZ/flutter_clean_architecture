import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/source/local/local_storage.dart';
import 'package:flutter_clean_architecture/domain/repository/app.dart';

class AppRepositoryImpl implements AppRepository {
  final LocalStorage _localStorage;

  AppRepositoryImpl({required LocalStorage localStorage})
      : _localStorage = localStorage;

  @override
  Locale loadLocale() {
return _localStorage.loadLocale();
  }

  @override
  ThemeMode loadTheme() {
return _localStorage.loadTheme();
  }

  @override
  Future<bool> saveLocale(Locale locale) {
return _localStorage.saveLocale(locale);
  }

  @override
  Future<bool> saveTheme(ThemeMode themeMode) {
return _localStorage.saveTheme(themeMode);
  }
}
