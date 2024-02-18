import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<UserCredential> anonymousSignIn() async {
    final user = await _auth.signInAnonymously();

    await _firestore.collection('users').doc(user.user!.uid).set({
      'uid': user.user!.uid,
      'creationTime': user.user!.metadata.creationTime,
      'participatedReports': [],
    });
    return user;
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }
}
