import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../product/models/report/report_model.dart';
import '../../../product/models/user/user_model.dart';

class ProfileService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future<List<ReportModel>> getParticipatedEvents() async {
    try {
      // Get the current user's ID
      final String currentUserId = _auth.currentUser!.uid;

      // Fetch the list of participated report IDs
      final DocumentSnapshot userDoc =
          await _firestore.doc('users/$currentUserId').get();
      final List<String> participatedReportIds =
          List<String>.from(userDoc.get('participatedReports'));

      // Fetch the corresponding ReportModel for each report ID
      final List<ReportModel> participatedReports = [];
      for (final String reportId in participatedReportIds) {
        final DocumentSnapshot<Map<String, dynamic>> reportDoc =
            await _firestore.doc('reports/$reportId').get();
        participatedReports.add(
            ReportModel.fromJson(reportDoc.data() as Map<String, dynamic>));
      }

      return participatedReports;
    } catch (e) {
      return [];
    }
  }
}
