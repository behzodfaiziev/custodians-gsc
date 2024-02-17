import 'package:custodians/core/widgets/app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../product/components/maps/app_maps.dart';
import '../../../../product/models/report/report_model.dart';
import '../../../profile/views/modules/profile_body.dart';

class ReportDetailsView extends StatelessWidget {
  const ReportDetailsView({super.key, required this.report});

  final ReportModel report;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: report.title ?? ""),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, left: 24, bottom: 12),
            child: Text(
              'Location',
              style: TextBigStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[600]!, width: 1.0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                child: AppMaps(
                  initialPosition:
                      CameraPosition(target: report.latLng, zoom: 14),
                  markers: {
                    Marker(
                        position: report.latLng,
                        markerId: MarkerId(report.id ?? ''))
                  },
                ),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(report.description ?? "")),
          if (report.imageUrl != null)
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[600]!, width: 1.0),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(13)),
                child: Image.network(
                  report.imageUrl ?? "",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.black,
                      size: 24,
                    ),
                    Text(
                      "  ${report.date}, ${report.time}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                      size: 24,
                    ),
                    Text(
                      "  ${report.location}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      color: Colors.black,
                      size: 24,
                    ),
                    Text(
                      "  ${report.createdBy}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 5,
                minimumSize: const Size(0, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Join",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
