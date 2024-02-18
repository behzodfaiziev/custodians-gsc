import 'package:custodians/core/extensions/context_extension.dart';
import 'package:custodians/features/report/views/report_details/report_details_view.dart';
import 'package:custodians/product/models/report/report_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/widgets/app_bar/base_app_bar.dart';
import '../../../product/components/maps/app_maps.dart';
import '../controller/map_controller.dart';

part 'maps_view_mixin.dart';

class MapsView extends StatefulWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> with MapsViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BaseAppBar(title: 'Find nearby events'),
        body: AppMaps(
          markers: markers,
          onMapTapped: onMapTapped,
        ));
  }
}
