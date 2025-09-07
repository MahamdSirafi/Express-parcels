import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/classes/local_database/strings_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/auth/data/repository/auth_repository.dart';
import 'package:spl/features/auth/data/services/auth_services.dart';

class AuthRepositoryImplementation implements AuthRepository {
  AuthServices authServices;
  AuthRepositoryImplementation({required this.authServices});
  @override
  Future<Either<Failures, Map<String, dynamic>>> forgetPasswordAuthRepository({
    required String email,
  }) async {
    final result = await authServices.postMethodAuthServices(
      path: '/users/forgotPassword',
      data: {'email': email},
    );
    return result.fold((failure) => Left(failure), (auth) {
      //in this api it's return token when i send my email in ForgetPasswordView, and this token i can find it inside value parameter(value the url parameter i can find the token)
      final url = auth.data['url'] as String?; //i get on full url value
      final token = url?.split('/').last;
      //1: look i want to get on token from url and the token i can find it in the last thing in value url parameter, so i will use .split() this method enable me to cut the String to many parts and i tell it .split('/') so if you see / in the String so cut because this will be part own it
      //example this is url('http://localhost:7000/api/v1.0.0/users/resetPassword/e6b4e9246bc84a28cd0dd7110d9dc31ffb90c44b7caa3e0c95092875a3eda1dc') and this is the token('e6b4e9246bc84a28cd0dd7110d9dc31ffb90c44b7caa3e0c95092875a3eda1dc') so when i use .split('/') the String will be like this
      //part1('http'), part2(''), part3('localhost:7000'), part4('api'), part5('v1.0.0'), part6('users'), part7('resetPassword'), part8('e6b4e9246bc84a28cd0dd7110d9dc31ffb90c44b7caa3e0c95092875a3eda1dc'),
      //2: now from this parts String(url?.split('/')) i tell it give me last(.last) part in this String
      if (token == null || token.isEmpty) {
        //if token is null or empty so return Error(snackBar) but i ensured that if there is no token i appear to user snackBar and stop so don't happen any problem in any another thing, and this token is important to reset password
        return Left(
          ErrorServer(
            errorMessageInFailuresClass: 'Error: no received to token',
          ),
        );
      }
      return Right({
        'message': auth.data['message'] ?? 'Token sent to email',
        //message to tell me the forget password work good
        'token': token,
        //this token come with forgetPassword in this api and i need to token to give it to resetPassword to accept order this email(with unique token) to change password it
      });
    });
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> loginAuthRepository({
    required String email,
    required String password,
  }) async {
    final result = await authServices.postMethodAuthServices(
      path: '/users/login',
      data: {'email': email, 'password': password},
    );
    return result.fold((failure) => Left(failure), (auth) async {
      final token = auth.data['token'];
      //token in ForgetPassword and in ResetPassword it's temporary and will be invalid, but there is token in login endpoint it's permanently for all app so i need to store this token
      final id = auth.data['user']['_id'];
      if (token == null || id == null) {
        return Left(
          ErrorServer(
            errorMessageInFailuresClass:
                'Error: not obtained token when you try login',
          ),
        );
      }
      await StringsSharedPreferencesClass.saveTokenMethodSharedPreferences(
        stringParameter: token,
        stringKey: kStringKeyTokenInSharedPreferences,
      ); //i store token in SharedPreferences so you can use it in any place
      await StringsSharedPreferencesClass.saveTokenMethodSharedPreferences(
        stringParameter: id,
        stringKey: kStringKeyIdInSharedPreferences,
      );
      return Right(auth.data);
    });
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> resetPasswordAuthRepository({
    required String token,
    required String newPassword,
  }) async {
    final result = await authServices.patchMethodAuthServices(
      path: '/users/resetPassword/$token',
      data: {'password': newPassword},
    );
    return result.fold((failure) => Left(failure), (auth) => Right(auth.data));
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> signUpAuthRepository({
    required String fullName,
    required String email,
    required String password,
    required String phone,
  }) async {
    final result = await authServices.postMethodAuthServices(
      path: '/users/signup',
      data: {
        'fullName': fullName,
        'phone': phone,
        'email': email,
        'password': password,
      },
    );
    return result.fold((failure) => Left(failure), (auth) => Right(auth.data));
  }
}
