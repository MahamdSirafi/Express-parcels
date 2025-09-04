abstract class TrackButtonState {}

class TrackButtonInitialState extends TrackButtonState {}

class TrackButtonLoadingState extends TrackButtonState {}

class TrackButtonSuccessState extends TrackButtonState {
  final bool stateConditionInCubit;
  TrackButtonSuccessState({required this.stateConditionInCubit});
}

class TrackButtonFailureState extends TrackButtonState {
  final String errorMessageInCubit;
  TrackButtonFailureState({required this.errorMessageInCubit});
}
