import 'package:custodians/features/report/service/report_service.dart';
import 'package:custodians/product/models/report/report_model.dart';

class CreateReportController {
  final ReportService _reportService = ReportService();

  Future<void> createReport(ReportModel report) async {
    return _reportService.createReport(report);
  }

  Future<String> uploadImage() async {
    return _reportService.uploadImage();
  }
}
