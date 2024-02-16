part of 'create_report_view.dart';

mixin CreateReportViewMixin on State<CreateReportView> {
  final CreateReportController _createReportController =
      CreateReportController();

  Set<Marker> selectedMarker = <Marker>{};
  XFile? image;

  final TextEditingController eventName = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController time = TextEditingController();
  final TextEditingController peopleNeeded = TextEditingController();
  final TextEditingController location = TextEditingController();

  bool organizedButtonEnabled = false;
  bool professionalsButtonEnabled = false;

  @override
  void dispose() {
    eventName.dispose();
    description.dispose();
    date.dispose();
    time.dispose();
    peopleNeeded.dispose();
    location.dispose();
    super.dispose();
  }

  Future<void> submitReport() async {

    if (selectedMarker.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a location")),
      );
      return;
    }
    if (eventName.text.isEmpty ||
        description.text.isEmpty ||
        date.text.isEmpty ||
        time.text.isEmpty ||
        peopleNeeded.text.isEmpty ||
        location.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the fields")),
      );
      return;
    }
    final report = ReportModel(
      title: eventName.text,
      description: description.text,
      status: "Pending",
      requiredPeople: int.parse(peopleNeeded.text),
      date: date.text,
      time: time.text,
      location: selectedMarker.first.position.toString(),
      imageUrl: image?.path ?? "",
      isEnded: false,
      currentPeople: 0,
      createdDate: DateTime.now().toString(),
      createdBy: "Anonymous user",
      latitude: selectedMarker.first.position.latitude,
      longitude: selectedMarker.first.position.longitude,
    );
    await _createReportController.createReport(report);
    if (context.mounted) Navigator.pop(context);
  }
}
