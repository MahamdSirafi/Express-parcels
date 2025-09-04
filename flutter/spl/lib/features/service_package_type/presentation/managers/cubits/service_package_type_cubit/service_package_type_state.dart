import 'package:spl/features/packages/presentation/managers/models/package_type_model.dart';
import 'package:spl/features/service_package_type/presentation/managers/models/service_package_type_model.dart';

abstract class ServicePackageTypeState {}

class ServicePackageTypeInitialState extends ServicePackageTypeState {}

class ServicePackageTypeLoadingState extends ServicePackageTypeState {}

class ServicePackageTypeSuccessState extends ServicePackageTypeState {
  final List<ServicePackageTypeModel> servicePackageTypeInCubit;
  ServicePackageTypeSuccessState({required this.servicePackageTypeInCubit});
}

class ServicePackageTypeFailureState extends ServicePackageTypeState {
  final String errorMessageInCubit;
  ServicePackageTypeFailureState({required this.errorMessageInCubit});
}
