import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/track/data/repository/tracking_repository.dart';
import 'package:spl/features/track/data/services/tracking_services.dart';

class TrackingRepositoryImplementation implements TrackingRepository {
  final TrackingServices trackingServices;
  TrackingRepositoryImplementation({required this.trackingServices});
  @override
  Future<Either<Failures, LatLng>> getParcelLocationRepository({
    required String parcelId,
  }) async {
    final result = await trackingServices.getParcelLocationServices(
      parcelId: parcelId,
    );
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (tracking) {
        final doc = tracking.data['doc'];
        if (doc == null ||
            doc['latitude'] == null ||
            doc['longitude'] == null) {
          return Left(
            ErrorServer(
              errorMessageInFailuresClass:
                  'Error: when try get on new location happened problem',
            ),
          );
        }
        return Right(
          LatLng(double.parse(doc['latitude']), double.parse(doc['longitude'])),
          //double.parse(because LatLng take value type double and the api return value type String)
        );
      },
    );
  }
}
