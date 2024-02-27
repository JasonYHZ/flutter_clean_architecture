import '../model/user.dart';
import '../repository/user.dart';

class UserCase {
  final UserRepository _userRepository;

  UserCase(this._userRepository);

  Future<User?> loadUser() async {
    return await _userRepository.loadUser();
  }

  Future<bool> deleteUser() async {
    return await _userRepository.deleteUser();
  }

  Future<User> refresh() async {
    return await _userRepository.refresh();
  }



}
