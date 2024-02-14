import 'package:custodians/core/extensions/context_extension.dart';
import 'package:custodians/features/report/views/report_details/report_details_view.dart';
import 'package:flutter/material.dart';

import '../../../../product/components/report_tile/report_tile.dart';
import '../../../../product/models/report/report_model.dart';

class ReportsListView extends StatelessWidget {
  const ReportsListView({
    required this.reports,
    super.key,
  });

  final List<ReportModel> reports;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reports.length,
      itemBuilder: (context, index) {
        return ReportTile(
          report: reports[index],
          onTap: () {
            context.push(ReportDetailsView(report: reports[index]));
          },
        );
      },
    );
  }
}
