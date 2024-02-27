import 'package:flutter_clean_architecture/data/repository/activity_impl.dart';
import 'package:flutter_clean_architecture/data/repository/app_impl.dart';
import 'package:flutter_clean_architecture/data/source/database/database.dart';
import 'package:flutter_clean_architecture/data/source/database/database_impl.dart';
import 'package:flutter_clean_architecture/data/source/local/local_storage.dart';
import 'package:flutter_clean_architecture/data/source/network/api.dart';
import 'package:flutter_clean_architecture/data/source/network/websocket.dart';
import 'package:flutter_clean_architecture/domain/repository/activitys.dart';
import 'package:flutter_clean_architecture/domain/repository/app.dart';
import 'package:flutter_clean_architecture/domain/usecase/app_case.dart';
import 'package:flutter_clean_architecture/domain/usecase/get_activity.dart';
import 'package:flutter_clean_architecture/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Presentation

/// -----------------------------------------------------------------------------
/// Domain
/// -----------------------------------------------------------------------------

@riverpod
class ActivityRepositoryNotifier extends _$ActivityRepositoryNotifier {
  @override
  ActivityRepository build() => ActivityRepositoryImpl(
      api: ref.read(apiNotifierProvider),
      localStorage: ref.read(localStorageNotifierProvider));
}

@riverpod
class AppRepositoryNotifier extends _$AppRepositoryNotifier {
  @override
  AppRepository build() =>
      AppRepositoryImpl(localStorage: ref.read(localStorageNotifierProvider));
}

/// Repository
/// -----------------------------------------------------------------------------
/// UseCase

@riverpod
class GetActivityNotifier extends _$GetActivityNotifier {
  @override
  GetActivity build() =>
      GetActivity(repository: ref.read(activityRepositoryNotifierProvider));
}

@riverpod
class AppUseCaseNotifier extends _$AppUseCaseNotifier {
  @override
  AppCase build() => AppCase(ref.read(appRepositoryNotifierProvider));
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
    return LocalStorageImpl(
      sharedPreferences: sharedPref,
      secureStorage: secureStorage,
    );
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
