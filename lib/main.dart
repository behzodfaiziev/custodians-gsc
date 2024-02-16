import 'package:custodians/product/init/theme/light_theme.dart';
import 'package:flutter/material.dart';

import 'features/_main/view/main_view.dart';
import 'features/report/views/create_report/create_report_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme().theme,
      home: const CreateReportView(),
    );
  }
}
