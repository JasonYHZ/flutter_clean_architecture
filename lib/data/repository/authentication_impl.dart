import 'package:flutter_clean_architecture/data/source/network/api.dart';
import 'package:flutter_clean_architecture/domain/repository/authentication.dart';

import '../source/local/local_storage.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final Api _api;
  final LocalStorage _localStorage;

  AuthenticationRepositoryImpl(
      {required Api api, required LocalStorage localStorage})
      : _api = api,
        _localStorage = localStorage;

  @override
  Future<bool> isSignedIn() async {
    return _api.isSignedIn();
  }

  @override
  Future<bool> signInWithCredentials(String email, String password) async {
    final token = await _api.signInWithCredentials(email, password);
    return await _localStorage.safeSaveToken(token);
  }

  @override
  Future<bool> signOut() async {
    await _api.signOut();
    await _localStorage.deleteToken();
    return true;
  }

  @override
  Future<bool> signUpWithCredentials(String email, String password) async {
    final token = await _api.signUpWithCredentials(email, password);
    return await _localStorage.safeSaveToken(token);
  }
}
