import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';

abstract class EditProfileRepository {
  Future<Either<Failures, Map<String, dynamic>>> editProfileRepository({
    required String fullName,
    required String email,
    required String phone,
  });
}
