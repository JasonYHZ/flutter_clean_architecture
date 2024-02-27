import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/data/entity/user_dto.dart';

import '../../entity/activity_dto.dart';
import '../local/local_storage.dart';

abstract class Api {
  Future<ActivityDto> loadActivity(
      {String activityType = '', CancelToken? cancelToken});

  Future<bool> isSignedIn();

  Future<String> signInWithCredentials(String email, String password);

  Future<bool> signOut();

  Future<String> signUpWithCredentials(String email, String password);

  Future<UserDto> getUserInfo();
}

class ApiImpl implements Api {
  final LocalStorage _localStorage;
  final Dio dio = Dio();

  ApiImpl({required LocalStorage localStorage}) : _localStorage = localStorage {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _localStorage.safeLoadToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));
  }

  @override
  Future<ActivityDto> loadActivity(
      {String activityType = '', CancelToken? cancelToken}) async {
    final response = await dio.get(
      'https://boredapi.com/api/activity',
      queryParameters: {'type': activityType},
      cancelToken: cancelToken,
    );

    final json = response.data as Map<String, dynamic>;
    return ActivityDto.fromJson(json);
  }

  @override
  Future<bool> isSignedIn() async {
    // TODO: MOCK
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  @override
  Future<String> signInWithCredentials(String email, String password) async {
    // TODO: MOCK
    await Future.delayed(const Duration(milliseconds: 500));
    return UniqueKey().toString();
  }

  @override
  Future<bool> signOut() async {
    // TODO: MOCK
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  @override
  Future<String> signUpWithCredentials(String email, String password) async {
    // TODO: MOCK
    await Future.delayed(const Duration(milliseconds: 500));
    return UniqueKey().toString();
  }

  @override
  Future<UserDto> getUserInfo() async {
    // TODO: MOCK

    await Future.delayed(const Duration(milliseconds: 500));

    return UserDto.fromJson({
      'id': '1111',
      'name': 'Jason',
      'email': 'jason@email.com',
      'avatar':
          'https://api.multiavatar.com/Starcrasher.png',
    });
  }
}
