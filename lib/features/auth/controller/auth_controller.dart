import 'package:firebase_auth/firebase_auth.dart';

import '../service/auth_service.dart';

class AuthController {
  final AuthService _authService = AuthService();

  Future<UserCredential?> signInAnonymously() async {
    return await _authService.anonymousSignIn();
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }

  Future<User?> currentUser() async {
    return _authService.getCurrentUser();
  }

}
