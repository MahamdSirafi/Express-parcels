import 'package:spl/features/packages/presentation/managers/models/package_type_model.dart';

abstract class PackageTypeState {}

class PackageTypeInitialState extends PackageTypeState {}

class PackageTypeLoadingState extends PackageTypeState {}

class PackageTypeSuccessState extends PackageTypeState {
  final List<PackageTypeModel> packageTypeInCubit;
  PackageTypeSuccessState({required this.packageTypeInCubit});
}

class PackageTypeFailureState extends PackageTypeState {
  final String errorMessageInCubit;
  PackageTypeFailureState({required this.errorMessageInCubit});
}
