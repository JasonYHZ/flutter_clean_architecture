import '../repository/authentication.dart';

class AuthenticationCase {
  final AuthenticationRepository _repository;

  AuthenticationCase(this._repository);

  Future<bool> login(String email, String password) async {
    return await _repository.signInWithCredentials(email, password);
  }

  Future<bool> register(String email, String password) async {
    return await _repository.signUpWithCredentials(email, password);
  }
}
