import 'package:custodians/core/widgets/app_bar/base_app_bar.dart';
import 'package:custodians/features/feed/views/modules/reports_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../product/models/report/report_model.dart';
import '../../controller/profile_controller.dart';

class ParticipatedEventsView extends StatefulWidget {
  const ParticipatedEventsView({Key? key}) : super(key: key);

  @override
  State<ParticipatedEventsView> createState() => _ParticipatedEventsViewState();
}

class _ParticipatedEventsViewState extends State<ParticipatedEventsView> {
  final ProfileController _profileController = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: 'Participated Events'),
      body: FutureBuilder<List<ReportModel>>(
          future: _profileController.getParticipatedEvents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'An error occurred: ${snapshot.error}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            } else if (snapshot.hasData) {
              return ReportsListView(reports: snapshot.data!);
            } else {
              return const Center(
                child: Text('No participated events found'),
              );
            }
          }),
    );
  }
}
