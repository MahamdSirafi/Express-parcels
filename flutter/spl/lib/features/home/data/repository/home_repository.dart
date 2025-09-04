import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failures, bool>> hasTheUserInThePastShipment();
  Future<Either<Failures, Map<String, dynamic>>> logOutFromEmailRepository();
}
