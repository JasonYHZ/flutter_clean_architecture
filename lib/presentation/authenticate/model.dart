import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app.dart';
import '../providers.dart';

part 'model.g.dart';

class AuthenticateState {
  final bool logging;

  AuthenticateState({
    required this.logging,
  });

  AuthenticateState copyWith({
    bool? logging,
  }) {
    return AuthenticateState(
      logging: logging ?? this.logging,
    );
  }
}

@riverpod
class AuthenticateViewModel extends _$AuthenticateViewModel {
  @override
  AuthenticateState build() => AuthenticateState(logging: false);

  Future<bool> signInWithEmailAndPassword(String email, String password) async {

    try {
      state = state.copyWith(logging: true);
      final loginStatus = await ref
          .read(authenticationCaseNotifierProvider)
          .login(email, password);

      if (loginStatus) {
        final user = await ref.read(userUseCaseNotifierProvider).loadUser();
        if (user != null) {
          ref.read(appStateNotificationProvider.notifier).setUser(user);
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } finally {
      state = state.copyWith(logging: false);
    }

  }
}
