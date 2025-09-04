import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failures, Map<String, dynamic>>> loginAuthRepository({
    required String email,
    required String password,
  });
  Future<Either<Failures, Map<String, dynamic>>> signUpAuthRepository({
    required String fullName,
    required String email,
    required String password,
    required String phone,
  });
  Future<Either<Failures, Map<String, dynamic>>> forgetPasswordAuthRepository({
    required String email,
  });
  Future<Either<Failures, Map<String, dynamic>>> resetPasswordAuthRepository({
    required String token,
    required String newPassword,
  });
}
