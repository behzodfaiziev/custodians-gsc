import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../product/models/report/report_model.dart';

class ReportService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? _currentUser = FirebaseAuth.instance.currentUser;
final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<bool> createReport(ReportModel report) async {
    try {
      if (_currentUser == null) return false;
      final DocumentReference docRef = _firestore.collection('reports').doc();

     final newReport =  report.copyWith(
        id: docRef.id,
        userId: _currentUser!.uid,
      );
      await docRef.set(newReport.toJson());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> uploadImage(File file) async {
   final result = await _storage.ref().child('images').putFile(file);
   return result.ref.getDownloadURL();
  }

  Future<bool> participateReport(ReportModel report) async {
    try {
      if (_currentUser == null) return false;
      final DocumentReference reportDocRef =
          _firestore.collection('reports').doc(report.id);
      final DocumentSnapshot reportSnapshot = await reportDocRef.get();

      if (!reportSnapshot.exists) return false;

      final List<dynamic> participants = reportSnapshot.get('participants');
      participants.add(_currentUser!.uid);

      await reportDocRef.update({'participants': participants});

      // Get the user's document reference
      final DocumentReference userDocRef =
          _firestore.collection('users').doc(_currentUser!.uid);
      final DocumentSnapshot userSnapshot = await userDocRef.get();

      // Check if the 'participatedReports' field exists, if not initialize it as an empty list
      final List<dynamic> participatedReports =
          userSnapshot.exists && userSnapshot.get('participatedReports') != null
              ? userSnapshot.get('participatedReports')
              : [];

      // Add the report's id to the 'participatedReports' list
      participatedReports.add(report.id);

      // Update the user's document with the new 'participatedReports' list
      await userDocRef.update({'participatedReports': participatedReports});

      return true;
    } catch (e) {
      return false;
    }
  }
}
