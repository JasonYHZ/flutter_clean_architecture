import 'dart:convert';

import 'package:flutter_clean_architecture/domain/model/activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedActivityKey = 'CACHED_ACTIVITY';

abstract class LocalStorage {
  Future<bool> saveActivity(
      {required String cacheKey, required Activity activity});

  String? loadActivity(String cacheKey);
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
}
