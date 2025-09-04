import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';

abstract class SendRatingsRepository {
  Future<Either<Failures, Map<String, dynamic>>> sendRatingsRepository({
    required String parcelId,
    required String comment,
    required int rate,
  });
}
