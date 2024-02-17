import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../product/models/report/report_model.dart';

class FeedService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ReportModel>> getReports() async {
    final QuerySnapshot<Object?> result = await _firestore
        .collection('reports')
        .where('isEnded', isEqualTo: false)
        .get();
    final List<ReportModel> reports = [];

    for (var element in result.docs) {
      reports.add(ReportModel.fromJson(element.data() as Map<String, dynamic>));
    }
    return reports;
  }
}
