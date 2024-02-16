import '../../../product/models/report/report_model.dart';

class ReportService {
  Future<void> createReport(ReportModel report) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Report created: ${report.toJson()}');
    return;
  }

  Future<String> uploadImage() async {
    await Future.delayed(const Duration(milliseconds: 500));
    //TODO: implement image upload
    return 'https://picsum.photos/200/300';
  }

  Future<void> deleteReport(ReportModel report) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Report deleted: ${report.toJson()}');
    return;
  }

  Future<bool> participateReport(ReportModel report) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Report participated: ${report.toJson()}');
    return true;
  }
}
