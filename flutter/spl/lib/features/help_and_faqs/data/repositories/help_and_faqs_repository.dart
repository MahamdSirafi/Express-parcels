import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';

abstract class HelpAndFaqsRepository {
  Future<Either<Failures, Map<String, dynamic>>>
  deleteAccountHelpAndFaqsRepository();
}
