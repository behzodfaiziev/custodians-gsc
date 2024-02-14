import 'package:custodians/core/extensions/context_extension.dart';
import 'package:custodians/core/widgets/app_bar/base_app_bar.dart';
import 'package:custodians/features/feed/views/modules/reports_list_view.dart';
import 'package:flutter/material.dart';

import '../../../product/models/report/report_model.dart';
import '../../report/views/create_report/create_report_view.dart';
import '../controller/feed_view_controller.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  final _controller = FeedViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: FutureBuilder<List<ReportModel>>(
            future: _controller.getReports(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ReportsListView(reports: snapshot.data!);
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }),
        floatingActionButton: addNewReportButton(context));
  }

  Widget addNewReportButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.push(const CreateReportView());
      },
      child: Icon(
        Icons.add,
        color: context.theme.iconTheme.color,
        size: 28,
      ),
    );
  }

  BaseAppBar get appBar {
    return BaseAppBar(
      title: 'Nearby Events',
      actions: [
        IconButton(
          icon: const Icon(
            Icons.filter_alt_outlined,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
