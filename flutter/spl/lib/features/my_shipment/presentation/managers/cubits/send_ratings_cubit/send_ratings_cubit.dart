import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/features/my_shipment/data/repository/send_ratings_repository_implementation.dart';
import 'package:spl/features/my_shipment/presentation/managers/cubits/send_ratings_cubit/send_ratings_state.dart';

class SendRatingsCubit extends Cubit<SendRatingsState> {
  final SendRatingsRepositoryImplementation sendRatingsRepositoryImplementation;
  SendRatingsCubit({required this.sendRatingsRepositoryImplementation})
    : super(SendRatingsInitialState());
  Future<void> submitRatingsToAPI({
    required String comment,
    required String parcelId,
    required int rate,
  }) async {
    emit(SendRatingsLoadingState());
    final result = await sendRatingsRepositoryImplementation
        .sendRatingsRepository(
          parcelId: parcelId,
          comment: comment,
          rate: rate,
        );
    result.fold(
      (failure) => emit(
        SendRatingsFailureState(
          errorMessageInCubit: failure.errorMessageInFailuresClass,
        ),
      ),
      (sendRate) => emit(SendRatingsSuccessState()),
      //i don't assign parameters in Success State because i send to api not receive from api
    );
  }
}
