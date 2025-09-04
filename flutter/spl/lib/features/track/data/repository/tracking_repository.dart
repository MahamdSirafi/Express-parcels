import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spl/core/utils/errors/failures.dart';

abstract class TrackingRepository {
  Future<Either<Failures, LatLng>> getParcelLocationRepository({
    required String parcelId,
  }); //this method for track in google map
  //Right(is type LatLng because i need to longitude and latitude to determine the location)
}
