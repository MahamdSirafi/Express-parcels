import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/features/auth/data/repository/auth_repository_implementation.dart';
import 'package:spl/features/auth/presentation/managers/cubits/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepositoryImplementation})
    : super(InitialAuthState());
  final AuthRepositoryImplementation authRepositoryImplementation;
  Future<void> loginMethodInCubit({
    required String email,
    required String password,
  }) async {
    emit(LoadingAuthState());
    final result = await authRepositoryImplementation.loginAuthRepository(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(
        FailureAuthState(
          errorMessageInFailureState: failure.errorMessageInFailuresClass,
        ),
      ),
      (auth) => emit(SuccessAuthState()),
    );
  }

  Future<void> signUpMethodInCubit({
    required String email,
    required String fullName,
    required String phone,
    required String password,
  }) async {
    emit(LoadingAuthState());
    final result = await authRepositoryImplementation.signUpAuthRepository(
      email: email,
      fullName: fullName,
      phone: phone,
      password: password,
    );
    result.fold(
      (failure) => emit(
        FailureAuthState(
          errorMessageInFailureState: failure.errorMessageInFailuresClass,
        ),
      ),
      (auth) => emit(SuccessAuthState()),
    );
  }

  Future<void> forgetPasswordMethodInCubit({required String email}) async {
    emit(LoadingAuthState());
    final result = await authRepositoryImplementation
        .forgetPasswordAuthRepository(email: email);
    result.fold(
      (failure) => emit(
        FailureAuthState(
          errorMessageInFailureState: failure.errorMessageInFailuresClass,
        ),
      ),
      (auth) => emit(SuccessAuthState(token: auth['token'])),
      //in AuthRepositoryImplementation i return Map and i tell you give me value that its key is token and assign this value to token parameter in SuccessAuthState
    );
  }

  Future<void> resetPasswordMethodInCubit({
    required String token,
    required String newPassword,
  }) async {
    emit(LoadingAuthState());
    final result = await authRepositoryImplementation
        .resetPasswordAuthRepository(token: token, newPassword: newPassword);
    result.fold(
      (failure) => emit(
        FailureAuthState(
          errorMessageInFailureState: failure.errorMessageInFailuresClass,
        ),
      ),
      (auth) => emit(SuccessAuthState()),
    );
  }
}
