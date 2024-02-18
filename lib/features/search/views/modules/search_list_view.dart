import 'package:custodians/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../product/components/report_tile/report_tile.dart';
import '../../../../product/models/report/report_model.dart';
import '../../../report/views/report_details/report_details_view.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.resultList});

  final List resultList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (context, index) {
        final report = ReportModel.fromJson(
            resultList[index].data() as Map<String, dynamic>);
        return ReportTile(
          report: report,
          onTap: () {
            context.push(ReportDetailsView(report: report));
          },
        );
      },
    );
  }
}
