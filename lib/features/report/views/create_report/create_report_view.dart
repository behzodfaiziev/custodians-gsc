import 'dart:io';

import 'package:custodians/core/widgets/app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../product/components/maps/app_maps.dart';
import '../../../../product/components/picker/file_picker_button.dart';

part 'create_report_view_mixin.dart';

class CreateReportView extends StatefulWidget {
  const CreateReportView({Key? key}) : super(key: key);

  @override
  State<CreateReportView> createState() => _CreateReportViewState();
}

class _CreateReportViewState extends State<CreateReportView>
    with CreateReportViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: 'New Report'),
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
                borderRadius: BorderRadius.circular(4),
              ),
              child: AppMaps(
                markers: selectedMarker,
                onMapTapped: (LatLng latLng) {
                  setState(() {
                    selectedMarker.add(Marker(
                      markerId: const MarkerId('Selected location'),
                      position: latLng,
                    ));
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Upload Image',
              style: TextBigStyle(),
            ),
          ),
          if (image != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24) +
                  const EdgeInsets.only(bottom: 20),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(image!),
                    fit: BoxFit.fitWidth,
                  ),
                  border: Border.all(color: Colors.grey[600]!, width: 1.0),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilePickerButton(
                onPressed: () {},
                text: 'Take Picture',
                icon: Icons.camera_alt_outlined,
              ),
              FilePickerButton(
                onPressed: () {},
                text: 'Choose Picture',
                icon: Icons.photo_outlined,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: eventName,
                  decoration: const InputDecoration(
                    hintText: "Event Name",
                  ),
                ),
                TextField(
                  controller: description,
                  decoration: const InputDecoration(
                    hintText: "Description",
                  ),
                ),
                TextField(
                  controller: date,
                  decoration: const InputDecoration(
                    hintText: "Date",
                  ),
                ),
                TextField(
                  controller: time,
                  decoration: const InputDecoration(
                    hintText: "Time",
                  ),
                ),
                TextField(
                  controller: peopleNeeded,
                  decoration: const InputDecoration(
                    hintText: "People Needed",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Organized By Me  ",
                  style: TextBigStyle(),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        organizedButtonEnabled
                            ? organizedButtonEnabled = false
                            : organizedButtonEnabled = true;
                      });
                    },
                    icon: Icon(
                      organizedButtonEnabled
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank,
                      color: Colors.black,
                      size: 30,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Professionals Needed  ",
                  style: TextBigStyle(),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        professionalsButtonEnabled
                            ? professionalsButtonEnabled = false
                            : professionalsButtonEnabled = true;
                      });
                    },
                    icon: Icon(
                      professionalsButtonEnabled
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank,
                      color: Colors.black,
                      size: 30,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 5,
                minimumSize: Size(0, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Submit",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextBigStyle extends TextStyle {
  @override
  double? get fontSize => 16;

  @override
  FontWeight? get fontWeight => FontWeight.w600;
}
