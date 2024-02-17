import 'package:firebase_auth/firebase_auth.dart';

import '../../../product/models/user/user_model.dart';

class ProfileService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<UserModel> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return UserModel(
      name: 'Celal Yeldus',
      email: 'user@gmail.com',
      imageUrl: 'https://picsum.photos/200/300',
      address: 'Türkiye, İstanbul',
      bio: 'I am a software developer',
      followers: 100,
      following: 50,
      leaders: ['İzzettin Karasayar', 'Celal Yeldus', 'Mehmet Yıldız'],
      organizedEvents: 10,
      participatedEvents: 20,
      ranking: '12/200',
    );
  }
}
