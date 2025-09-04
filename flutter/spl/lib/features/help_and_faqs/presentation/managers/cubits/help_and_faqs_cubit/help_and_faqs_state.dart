abstract class HelpAndFaqsState {}

class InitialHelpAndFaqsState extends HelpAndFaqsState {}

class LoadingHelpAndFaqsState extends HelpAndFaqsState {}

class SuccessHelpAndFaqsState extends HelpAndFaqsState {}

class FailureHelpAndFaqsState extends HelpAndFaqsState {
  final String errorMessageInFailureState;
  FailureHelpAndFaqsState({required this.errorMessageInFailureState});
}
