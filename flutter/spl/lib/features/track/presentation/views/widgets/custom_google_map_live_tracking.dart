import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMapLiveTracking extends StatelessWidget {
  const CustomGoogleMapLiveTracking({
    super.key,
    required this.onMapCreated,
    required this.markers,
  });
  final void Function(GoogleMapController)? onMapCreated;
  final Set<Marker> markers;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(33.510414, 36.278336),
        //when you open the in the first, in the map there is camera and this camera focuse on position in the first so this position it's target
        zoom: 13.5,
        //zoom in/out value it is 13.5
      ),
      onMapCreated: onMapCreated,
      //The GoogleMapController gives you control over the map(zoom, move the camera(You only get this controller once, when the map is first created), etc), You save it (often using a Completer) so you can use it later
      //why use completer because The map takes time to load, so the controller is not available immediately, Completer<GoogleMapController> acts like a “promise” it waits until the map is ready, Later you can call completer.future.then((controller) => ...) to use it
      markers: markers, //mark on map
    );
  }
}
