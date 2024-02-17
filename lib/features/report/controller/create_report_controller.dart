import 'dart:io';

import 'package:custodians/features/report/service/report_service.dart';
import 'package:custodians/product/models/report/report_model.dart';

class CreateReportController {
  final ReportService _reportService = ReportService();

  Future<bool> createReport(ReportModel report) async {
    return await _reportService.createReport(report);
  }

  Future<String> uploadImage(File  file) async {
    return _reportService.uploadImage(file);
  }
}
