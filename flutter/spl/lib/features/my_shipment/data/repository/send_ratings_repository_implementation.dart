import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/my_shipment/data/repository/send_ratings_repository.dart';
import 'package:spl/features/my_shipment/data/services/send_ratings_services.dart';

class SendRatingsRepositoryImplementation implements SendRatingsRepository {
  final SendRatingsServices sendRatingsServices;
  SendRatingsRepositoryImplementation({required this.sendRatingsServices});
  @override
  Future<Either<Failures, Map<String, dynamic>>> sendRatingsRepository({
    required String parcelId,
    required String comment,
    required int rate,
  }) async {
    final result = await sendRatingsServices.postRatingsServices(
      parcelId: parcelId,
      comment: comment,
      rate: rate,
    );
    return result.fold(
      (failure) => Left(failure),
      (rating) => Right(rating.data),
    );
  }
}
