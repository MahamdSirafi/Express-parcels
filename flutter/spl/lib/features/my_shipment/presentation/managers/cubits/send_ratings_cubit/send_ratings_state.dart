abstract class SendRatingsState {}

class SendRatingsInitialState extends SendRatingsState {}

class SendRatingsLoadingState extends SendRatingsState {}

class SendRatingsSuccessState extends SendRatingsState {}

class SendRatingsFailureState extends SendRatingsState {
  final String errorMessageInCubit;
  SendRatingsFailureState({required this.errorMessageInCubit});
}
