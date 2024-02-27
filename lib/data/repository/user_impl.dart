import 'dart:convert';

import 'package:flutter_clean_architecture/data/entity/user_dto.dart';
import 'package:flutter_clean_architecture/data/source/local/local_storage.dart';
import 'package:flutter_clean_architecture/data/source/network/api.dart';
import 'package:flutter_clean_architecture/domain/model/user.dart';
import 'package:flutter_clean_architecture/domain/repository/user.dart';

class UserRepositoryImpl extends UserRepository {
  final Api _api;
  final LocalStorage _localStorage;

  UserRepositoryImpl({required Api api, required LocalStorage localStorage})
      : _api = api,
        _localStorage = localStorage;

  @override
  Future<bool> deleteUser() async {
    await _localStorage.deleteToken();
    await _localStorage.deleteUser();

    return true;
  }

  @override
  Future<User?> loadUser() async {
    final jsonString = _localStorage.loadUser();
    if (jsonString != null && jsonString.isNotEmpty) {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return UserDto.fromJson(json);
    }

    final token = await _localStorage.safeLoadToken();
    if (token != null) {
      final response = await _api.getUserInfo();
      await _localStorage.saveUser(response);
      return response;
    }
    return null;
  }

  @override
  Future<User> refresh() async {
    final response = await _api.getUserInfo();
    await _localStorage.saveUser(response);
    return response;
  }
}
