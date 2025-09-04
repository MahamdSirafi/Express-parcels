import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/features/service_package_type/data/repositories/service_package_type_repositories_implementation.dart';
import 'package:spl/features/service_package_type/presentation/managers/cubits/service_package_type_cubit/service_package_type_state.dart';

class ServicePackageTypeCubit extends Cubit<ServicePackageTypeState> {
  ServicePackageTypeCubit({
    required this.servicePackageTypeRepositoriesImplementation,
  }) : super(ServicePackageTypeInitialState());
  final ServicePackageTypeRepositoriesImplementation
  servicePackageTypeRepositoriesImplementation;
  Future<void> getServicePackagesMethod() async {
    emit(ServicePackageTypeLoadingState());
    final result =
        await servicePackageTypeRepositoriesImplementation
            .fetchServicePackageType();
    result.fold(
      (failure) => emit(
        ServicePackageTypeFailureState(
          errorMessageInCubit: failure.errorMessageInFailuresClass,
        ),
      ),
      (packageTypes) => emit(
        ServicePackageTypeSuccessState(servicePackageTypeInCubit: packageTypes),
      ),
    );
  }
}
