abstract class LogoutState {}

class LogoutInitialState extends LogoutState {}

class LougoutLoadingState extends LogoutState {}

class LougoutSuccessState extends LogoutState {}

class LougoutFailureState extends LogoutState {
  final String errorMessageInCubit;
  LougoutFailureState({required this.errorMessageInCubit});
}
