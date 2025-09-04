abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {
  final String? token;
  //i want to receive this parameter because i want to send value it to ResetPasswordView when i navigate from ForgetPasswordView
  SuccessAuthState({this.token});
}

class FailureAuthState extends AuthState {
  final String errorMessageInFailureState;
  FailureAuthState({required this.errorMessageInFailureState});
}
