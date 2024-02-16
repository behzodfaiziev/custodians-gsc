import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppMaps extends StatefulWidget {
  const AppMaps({
    super.key,
    required this.onMapTapped,
    this.markers,
  });

  final void Function(LatLng) onMapTapped;
  final Set<Marker>? markers;
  @override
  State<AppMaps> createState() => _AppMapsState();
}

class _AppMapsState extends State<AppMaps> {
  CameraPosition get initialPosition =>
      const CameraPosition(target: LatLng(41.025886, 28.889445), zoom: 17);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialPosition,
      onTap: widget.onMapTapped,
      buildingsEnabled: false,
      compassEnabled: true,
      fortyFiveDegreeImageryEnabled: false,
      mapToolbarEnabled: true,
      mapType: MapType.normal,
      markers: widget.markers ?? {},
      minMaxZoomPreference: const MinMaxZoomPreference(10, 20),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
    );
  }
}
