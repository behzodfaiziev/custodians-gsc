import 'package:flutter/material.dart';

import '../../models/report/report_model.dart';

class ReportTile extends StatelessWidget {
  const ReportTile({
    required this.report,
    required this.onTap,
    super.key,
  });

  final ReportModel report;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(height: 200,color: Colors.amber,margin: EdgeInsets.all(8),//ui burada duzenle
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(report.imageUrl ?? ''),
          ),
          title: Text(report.title ?? ''),
          subtitle: Text(report.location ?? ''),
        ),
      ),
    );
  }
}
