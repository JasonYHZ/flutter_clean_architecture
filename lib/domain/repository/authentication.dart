abstract class AuthenticationRepository {
  Future<bool> signInWithCredentials(String email, String password);

  Future<bool> signUpWithCredentials(String email, String password);

  Future<bool> signOut();

  Future<bool> isSignedIn();
}