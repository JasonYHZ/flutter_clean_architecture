import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/source/local/local_storage.dart';
import 'package:flutter_clean_architecture/data/source/network/api.dart';
import 'package:flutter_clean_architecture/domain/model/activity.dart';
import 'package:flutter_clean_architecture/domain/repository/activitys.dart';

import '../entity/activity_dto.dart';


class ActivityRepositoryImpl implements ActivityRepository {
  final Api _api;
  final LocalStorage _localStorage;

  final Map<String, CancelToken> _cancelTokenMap = {};

  ActivityRepositoryImpl({required Api api, required LocalStorage localStorage})
      : _api = api,
        _localStorage = localStorage;

  @override
  Future<Activity> loadActivity(
      {String activityType = '', String? cancelKey}) async {


    final cachedActivity = _localStorage.loadActivity('activity');

    if (cachedActivity != null) {
      final json = jsonDecode(cachedActivity);
      return ActivityDto.fromJson(json);
    }

    if (cancelKey != null) {
      _cancelTokenMap[cancelKey] = CancelToken();
    }

    final response = await _api
        .loadActivity(
            activityType: activityType, cancelToken: _cancelTokenMap[cancelKey])
        .whenComplete(() => _cancelTokenMap.remove(cancelKey));

    await _localStorage.saveActivity(cacheKey: 'activity', activity: response);

    return response;
  }

  @override
  void cancelActivityLoad(String? cancelKey) {
    if (cancelKey != null) {
      _cancelTokenMap[cancelKey]?.cancel();
      _cancelTokenMap.remove(cancelKey);
    }
  }
}
