import 'package:custodians/core/widgets/app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../product/models/report/report_model.dart';

class ReportDetailsView extends StatelessWidget {
  const ReportDetailsView({super.key, required this.report});

  final ReportModel report;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: BaseAppBar(title: report.title??''),//ozellikleri buradan gonder 
    );
  }
}
