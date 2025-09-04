import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<void> moveCameraHelper({
  required LatLng latLng,
  required Completer<GoogleMapController> completer,
}) async {
  final controller = await completer.future;
  //waits until completer is available(map is ready)
  controller.animateCamera(CameraUpdate.newLatLng(latLng));
  //when you open the map so the camera in map will focus on currentLocation, it moves the map focus, but not only once you can call it every time new location comes, like you do in the listener
}
