import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/managers/cubits/logout_cubit/logout_state.dart';
import 'package:spl/features/home/data/repository/home_repository_implementation.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit({required this.homeRepositoryImplementation})
    : super(LogoutInitialState());
  final HomeRepositoryImplementation homeRepositoryImplementation;
  Future<void> logoutMethodInCubit() async {
    emit(LougoutLoadingState());
    final result =
        await homeRepositoryImplementation.logOutFromEmailRepository();
    return result.fold(
      (failure) => emit(
        LougoutFailureState(
          errorMessageInCubit: failure.errorMessageInFailuresClass,
        ),
      ),
      (logout) => emit(LougoutSuccessState()),
    );
  }
}
