import 'package:spl/features/service_center_details/presentation/managers/models/service_center_details_model.dart';

abstract class ServiceCenterDetailsState {}

class InitialServiceCenterDetailsState extends ServiceCenterDetailsState {}

class LoadingServiceCenterDetailsState extends ServiceCenterDetailsState {}

class SuccessServiceCenterDetailsState extends ServiceCenterDetailsState {
  final ServiceCenterDetailsModel listOfServiceCentersDetailsInCubit;
  SuccessServiceCenterDetailsState({
    required this.listOfServiceCentersDetailsInCubit,
  });
}

class FailureServiceCenterDetailsState extends ServiceCenterDetailsState {
  final String errorMessageInCubit;
  FailureServiceCenterDetailsState({required this.errorMessageInCubit});
}
