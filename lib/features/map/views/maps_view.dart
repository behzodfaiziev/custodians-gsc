import 'package:flutter/material.dart';

import '../../../core/widgets/app_bar/base_app_bar.dart';

class MapsView extends StatefulWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar(title: 'Find nearby events'),
      body: Center(
        child: Text('MapsView'),
      ),
    );
  }
}
