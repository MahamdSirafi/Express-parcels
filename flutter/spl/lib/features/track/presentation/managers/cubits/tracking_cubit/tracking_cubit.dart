import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/core/utils/constants/duration_variables_constant.dart';
import 'package:spl/features/track/data/repository/tracking_repository_implementation.dart';
import 'package:spl/features/track/presentation/managers/cubits/tracking_cubit/tracking_state.dart';

class TrackingCubit extends Cubit<TrackingState> {
  TrackingCubit({required this.trackingRepositoryImplementation})
    : super(InitialTrackingState());
  final TrackingRepositoryImplementation trackingRepositoryImplementation;
  Timer? timer;
  //you create Timer parameter because i want to do thing related in time and this thing is give update location(when i take new longitude and latitude from backend) every five seconds
  void startTracking({required String parcelId}) {
    timer?.cancel();
    //i clear the time and this clear benefit to ensure there wasn't old time(question: in this method this line not necessary because i use it in stopTracking method, answer: You should always cancel before starting a new one to prevent multiple timers running in parallel, and stopTrcking method possible not be called because should the user trigger startTracking method many times(navigate between views many times so this thing maybe cause problem because the timer will start work always when the user come to TrackingView))
    timer = Timer.periodic(kFiveSeconds, (_) async {
      await getParcelLocation(parcelId: parcelId);
    });
    //i assign new time(five seconds) so after all five seconds i trigger the method(getParcelLocation)
  }

  void stopTracking() {
    timer?.cancel();
    //i clear the time
    emit(InitialTrackingState());
    //it tells the ui to go back to an start state(example: stop showing loading or location), so emitting InitialTrackingState() helps the ui reset when tracking is stopped
  }

  Future<void> getParcelLocation({required String parcelId}) async {
    emit(LoadingTrackingState());
    final result = await trackingRepositoryImplementation
        .getParcelLocationRepository(parcelId: parcelId);
    result.fold(
      (failure) => emit(
        FailureTrackingState(
          errorMessageInCubit: failure.errorMessageInFailuresClass,
        ),
      ),
      (latLng) => emit(SuccessTrackingState(latLngInCubit: latLng)),
    );
  }
}
