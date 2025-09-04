import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/features/service_center_details/data/repositories/service_center_details_repository_implementation.dart';
import 'package:spl/features/service_center_details/presentation/managers/cubits/service_center_details_cubit/service_center_details_state.dart';

class ServiceCenterDetailsCubit extends Cubit<ServiceCenterDetailsState> {
  ServiceCenterDetailsCubit({
    required this.serviceCenterDetailsRepositoryImplementation,
  }) : super(InitialServiceCenterDetailsState());
  final ServiceCenterDetailsRepositoryImplementation
  serviceCenterDetailsRepositoryImplementation;
  Future<void> getMethodServiceCentersCubit({required int index}) async {
    if (isClosed) return; //if cubit is closed so don't do anything
    emit(LoadingServiceCenterDetailsState());
    final result =
        await serviceCenterDetailsRepositoryImplementation
            .getServiceCenterDetails();
    if (isClosed) return; //if cubit is closed so don't do anything
    result.fold(
      (failure) {
        if (!isClosed) {
          //if cubit isn't closed so do emit
          return emit(
            FailureServiceCenterDetailsState(
              errorMessageInCubit: failure.errorMessageInFailuresClass,
            ),
          );
        }
      },
      (serviceCenters) {
        if (index < serviceCenters.length) {
          if (!isClosed) {
            return emit(
              SuccessServiceCenterDetailsState(
                listOfServiceCentersDetailsInCubit: serviceCenters[index],
              ),
            );
          }
        }
      },
    );
  }
}
