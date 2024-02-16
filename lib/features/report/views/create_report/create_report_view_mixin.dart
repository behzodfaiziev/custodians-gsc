part of 'create_report_view.dart';

mixin CreateReportViewMixin on State<CreateReportView> {
  Set<Marker> selectedMarker = <Marker>{};
  File? image;

  TextEditingController eventName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController peopleNeeded = TextEditingController();

  bool organizedButtonEnabled = false;
  bool professionalsButtonEnabled = false;
}
