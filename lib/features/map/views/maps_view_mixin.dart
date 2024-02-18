part of 'maps_view.dart';

mixin MapsViewMixin on State<MapsView> {
  final MapController _mapController = MapController();
  List<ReportModel> reports = [];
  Set<Marker> markers = {};

  @override
  void initState() {
    fetReports();
    super.initState();
  }

  Future<void> fetReports() async {
    reports.addAll(await _mapController.getReports());
    setState(() {
      for (var report in reports) {
        markers.add(
          Marker(
            markerId: MarkerId(report.id ?? '1'),
            position: report.latLng,
            infoWindow: InfoWindow(title: report.title),
            onTap: () {
              context.push(ReportDetailsView(report: report));
            },
          ),
        );
      }
    });
  }

  CameraPosition get initialPosition =>
      const CameraPosition(target: LatLng(41.025886, 28.889445), zoom: 17);

  void onMapTapped(LatLng latLng) {}

  Set<Marker> get generatedMarkers => <Marker>{
        Marker(
          markerId: const MarkerId('Picking Up Garbage From Forest'),
          position: const LatLng(41.025886, 28.889445),
          infoWindow: const InfoWindow(title: 'Marker 1'),
          onTap: onMarkerTapped,
        ),
        Marker(
          markerId: const MarkerId('Clean Earth Campaign'),
          position: const LatLng(41.022176698471995, 28.897198252379894),
          infoWindow: const InfoWindow(title: 'Marker 2'),
          onTap: onMarkerTapped,
        ),
      };

  void onMarkerTapped() {
    context.push(ReportDetailsView(
        report: ReportModel(
      imageUrl: 'https://picsum.photos/200/300',
      title: 'Clean Earth Campaign',
      description:
          'Join us for a day dedicated to making a positive impact on our planet! The Clean Earth Campaign is an initiative aimed at preserving the environment by organizing community clean-up events. Activities will include picking up litter, recycling, planting trees, and more. Participants of all ages and backgrounds are welcome. Together, we can create a cleaner, greener future for generations to come.',
      location: 'Yildiz Teknik Universitesi, Istanbul, Turkey',
      currentPeople: 10,
      createdBy: 'John Doe',
      createdDate: DateTime.now().toString(),
      id: '1',
      isEnded: false,
      requiredPeople: 20,
      status: 'Active',
      time: '10:00 - 12:00',
      date: DateTime.now().toString(),
      // latLong: LatLng(41.022176698471995, 28.897198252379894),
    )));
  }
}
