import 'package:custodians/core/widgets/app_bar/base_app_bar.dart';
import 'package:custodians/features/report/controller/report_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../product/components/maps/app_maps.dart';
import '../../../../product/models/report/report_model.dart';
import '../../../profile/views/modules/profile_body.dart';

class ReportDetailsView extends StatefulWidget {
  const ReportDetailsView({super.key, required this.report});

  final ReportModel report;

  @override
  State<ReportDetailsView> createState() => _ReportDetailsViewState();
}

class _ReportDetailsViewState extends State<ReportDetailsView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: widget.report.title ?? ""),
      body: isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : ListView(
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
                        initialPosition: CameraPosition(
                            target: widget.report.latLng, zoom: 14),
                        markers: {
                          Marker(
                              position: widget.report.latLng,
                              markerId: MarkerId(widget.report.id ?? ''))
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(widget.report.description ?? "")),
                if (widget.report.imageUrl != null)
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[600]!, width: 1.0),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(13)),
                      child: Image.network(
                        widget.report.imageUrl ?? "",
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                            "  ${widget.report.date}, ${widget.report.time}",
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
                            "  ${widget.report.location}",
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
                            "  ${widget.report.createdBy}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Container(
                      height: 40,
                      color: Colors.green,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(15, 9, 5, 5),
                        child: Text("Chat",style: TextStyle(fontSize: 18),),
                      ),
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 9, 9, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("   İzzettin Karasayar",style: TextSmallStyle(),),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                            child: const Text("So we have enough trash bags, right?",style: TextStyle(fontSize: 14),),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("   Celal Yeldus   ",style: TextSmallStyle(),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                child: const Text("Yes, I will get them.",style: TextStyle(fontSize: 14),),
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      final bool isSuccess = await ReportController()
                          .participateInEvent(widget.report);
                      setState(() {
                        isLoading = false;
                      });
                      if (isSuccess && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("You have joined the event"),
                          ),
                        );
                      } else if (isSuccess == false && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Failed to join the event"),
                          ),
                        );
                      }
                    },
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
