import 'package:custodians/core/widgets/app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';

class CreateReportView extends StatefulWidget {
  const CreateReportView({Key? key}) : super(key: key);

  @override
  State<CreateReportView> createState() => _CreateReportViewState();
}

class _CreateReportViewState extends State<CreateReportView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: BaseAppBar(title: 'New Report'),
        body: Center(
          child: Text('CreateReportView'),
        ));
  }
}
