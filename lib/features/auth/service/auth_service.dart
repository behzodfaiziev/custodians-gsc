import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<UserCredential> anonymousSignIn() async {
    return _auth.signInAnonymously();
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }
}