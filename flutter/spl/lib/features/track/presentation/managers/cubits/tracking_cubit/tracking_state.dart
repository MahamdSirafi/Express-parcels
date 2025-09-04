import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class TrackingState {}

class InitialTrackingState extends TrackingState {}

class LoadingTrackingState extends TrackingState {}

class SuccessTrackingState extends TrackingState {
  final LatLng latLngInCubit;
  SuccessTrackingState({required this.latLngInCubit});
}

class FailureTrackingState extends TrackingState {
  final String errorMessageInCubit;
  FailureTrackingState({required this.errorMessageInCubit});
}
