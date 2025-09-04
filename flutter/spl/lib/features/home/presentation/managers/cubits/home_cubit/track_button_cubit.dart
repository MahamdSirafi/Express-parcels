import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/features/home/data/repository/home_repository_implementation.dart';
import 'package:spl/features/home/presentation/managers/cubits/home_cubit/track_button_state.dart';

class TrackButtonCubit extends Cubit<TrackButtonState> {
  TrackButtonCubit({required this.homeRepositoryImplementation})
    : super(TrackButtonInitialState());
  final HomeRepositoryImplementation homeRepositoryImplementation;
  Future<void> hasShipment() async {
    emit(TrackButtonLoadingState());
    final result =
        await homeRepositoryImplementation.hasTheUserInThePastShipment();
    result.fold(
      (failure) => emit(
        TrackButtonFailureState(
          errorMessageInCubit: failure.errorMessageInFailuresClass,
        ),
      ),
      (areThereShipments) => emit(
        TrackButtonSuccessState(stateConditionInCubit: areThereShipments),
      ),
    );
  }
}
