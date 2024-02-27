import '../model/user.dart';

abstract class UserRepository {
  Future<User?> loadUser();

  Future<bool> deleteUser();

  Future<User> refresh();
}
