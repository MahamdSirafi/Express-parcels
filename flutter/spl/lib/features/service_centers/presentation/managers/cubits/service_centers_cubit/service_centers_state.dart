import 'package:spl/features/service_centers/presentation/managers/models/service_centers_model.dart';

abstract class ServiceCentersState {}

class ServiceCentersInitialState extends ServiceCentersState {}

class ServiceCentersLoadingState extends ServiceCentersState {}

class ServiceCentersSuccessState extends ServiceCentersState {
  final List<ServiceCentersModel> listOfServiceCentersInCubit;
  ServiceCentersSuccessState({required this.listOfServiceCentersInCubit});
}

class ServiceCentersFailureState extends ServiceCentersState {
  final String errorMessageInCubit;
  ServiceCentersFailureState({required this.errorMessageInCubit});
}
