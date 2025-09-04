import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/features/help_and_faqs/data/repositories/help_and_faqs_repository_implementation.dart';
import 'package:spl/features/help_and_faqs/presentation/managers/cubits/help_and_faqs_cubit/help_and_faqs_state.dart';

class HelpAndFaqsCubit extends Cubit<HelpAndFaqsState> {
  HelpAndFaqsCubit({required this.helpAndFaqsRepositoryImplementation})
    : super(InitialHelpAndFaqsState());
  final HelpAndFaqsRepositoryImplementation helpAndFaqsRepositoryImplementation;
  Future<void> deleteAccountMethodInCubit() async {
    emit(LoadingHelpAndFaqsState());
    final result =
        await helpAndFaqsRepositoryImplementation
            .deleteAccountHelpAndFaqsRepository();
    result.fold(
      (failure) => emit(
        FailureHelpAndFaqsState(
          errorMessageInFailureState: failure.errorMessageInFailuresClass,
        ),
      ),
      (delete) => emit(SuccessHelpAndFaqsState()),
    );
  }
}
