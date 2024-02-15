import 'package:custodians/core/widgets/app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';

class CreateReportView extends StatefulWidget {
  const CreateReportView({Key? key}) : super(key: key);

  @override
  State<CreateReportView> createState() => _CreateReportViewState();
}

class _CreateReportViewState extends State<CreateReportView> {
  TextEditingController eventName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController peopleNeeded = TextEditingController();

  bool organizedButtonEnabled = false;
  bool professionalsButtonEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: 'New Report'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Location',
              style: TextBigStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image.network(
                "https://picsum.photos/200/300",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black26,
                    elevation: 0,
                    minimumSize: const Size(120, 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.camera_alt_outlined,color: Colors.black,),
                      Text("Take Picture",style: TextStyle(color: Colors.black),),
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.black26,
                    minimumSize: const Size(120, 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.image_outlined,color: Colors.black,),
                      Text("Upload Image",style: TextStyle(color: Colors.black),),
                    ],
                  ))
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
                        organizedButtonEnabled ?
                        organizedButtonEnabled = false :
                        organizedButtonEnabled = true;
                      });
                    },
                    icon: Icon(
                      organizedButtonEnabled ?
                      Icons.check_box_outlined :
                      Icons.check_box_outline_blank,
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
                        professionalsButtonEnabled ?
                        professionalsButtonEnabled = false :
                        professionalsButtonEnabled = true;
                      });
                    },
                    icon: Icon(
                      professionalsButtonEnabled ?
                      Icons.check_box_outlined :
                      Icons.check_box_outline_blank,
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
  // TODO: implement fontSize
  double? get fontSize => 18;

  @override
  // TODO: implement fontWeight
  FontWeight? get fontWeight => FontWeight.w600;
}

