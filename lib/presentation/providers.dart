import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/repository/activity_impl.dart';
import 'package:flutter_clean_architecture/data/source/database/database.dart';
import 'package:flutter_clean_architecture/data/source/database/database_impl.dart';
import 'package:flutter_clean_architecture/data/source/local/local_storage.dart';
import 'package:flutter_clean_architecture/data/source/network/api.dart';
import 'package:flutter_clean_architecture/data/source/network/websocket.dart';
import 'package:flutter_clean_architecture/domain/repository/activitys.dart';
import 'package:flutter_clean_architecture/domain/usecase/get_activity.dart';
import 'package:flutter_clean_architecture/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app.dart';
import 'theme.dart';

part 'providers.g.dart';

@riverpod
class AppStateNotification extends _$AppStateNotification {
  @override
  AppState build() {
    return const AppState(
        locale: Locale('en', 'US'),
        themeMode: ThemeMode.system,
        themeData: CustomTheme());
  }

  void setThemeMode(ThemeMode themeMode) {
    state = state.copyWith(themeMode: themeMode);
  }

  void setLocale(Locale locale) {
    state = state.copyWith(locale: locale);
  }
}

/// Presentation

/// Domain

@riverpod
class ActivityRepositoryNotifier extends _$ActivityRepositoryNotifier {
  @override
  ActivityRepository build() => ActivityRepositoryImpl(
      api: ref.read(apiNotifierProvider),
      localStorage: ref.read(localStorageNotifierProvider));
}

@riverpod
class GetActivityNotifier extends _$GetActivityNotifier {
  @override
  GetActivity build() =>
      GetActivity(repository: ref.read(activityRepositoryNotifierProvider));
}

/// Data

@riverpod
class ApiNotifier extends _$ApiNotifier {
  @override
  Api build() => ApiImpl();
}

@riverpod
class LocalStorageNotifier extends _$LocalStorageNotifier {
  @override
  LocalStorage build() {
    return LocalStorageImpl(sharedPreferences: sharedPref);
  }
}

@riverpod
class DatabaseNotifier extends _$DatabaseNotifier {
  @override
  Database build() {
    return DatabaseImpl(
        dbName: 'database.db', inMemory: false, logStatements: false);
  }
}

@riverpod
class WebsocketNotifier extends _$WebsocketNotifier {
  @override
  Websocket build() {
    return WebsocketImpl();
  }
}
