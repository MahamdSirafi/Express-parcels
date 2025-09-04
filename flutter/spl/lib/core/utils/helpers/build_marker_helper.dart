import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/features/track/presentation/managers/cubits/tracking_cubit/tracking_state.dart';

Set<Marker> buildMarkerHelper({
  required dynamic state,
  required LatLng currentLocation,
  BitmapDescriptor? icon,
}) {
  //if you want extract widget and you can't use stateless or stateful because type the widget that you want extract it is diffrent, so create function and type this function same type the widget
  final markers = <Marker>{};
  if (icon != null) {
    //i add truckIcon mark to google map
    markers.add(
      Marker(
        markerId: const MarkerId(kCurrentLocationID),
        position: currentLocation,
        icon: icon,
      ),
    );
  }
  if (state is LoadingTrackingState) {
    //i add truckIcon to google map and i Loading.. text when the state is LoadingState
    markers.add(
      Marker(
        markerId: const MarkerId(kLoadingID),
        position: currentLocation,
        infoWindow: const InfoWindow(title: 'Loading...'),
        //you’re showing the label Loading....
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        ), //So in loading state, you’re showing a yellow marker
      ),
    );
  }
  return markers;
}
