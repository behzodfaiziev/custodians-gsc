import 'package:custodians/core/extensions/context_extension.dart';
import 'package:custodians/core/widgets/app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';

import '../../report/views/create_report/create_report_view.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: const Center(
          child: Text('FeedView'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(const CreateReportView());
          },
          child: Icon(
            Icons.add,
            color: context.theme.iconTheme.color,
            size: 28,
          ),
        ));
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
