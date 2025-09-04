import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spl/features/packages/data/repositories/package_type_repositories_implementation.dart';
import 'package:spl/features/packages/presentation/managers/cubits/package_type_cubit/package_type_state.dart';

class PackageTypeCubit extends Cubit<PackageTypeState> {
  PackageTypeCubit({required this.packageTypeRepositoriesImplementation})
    : super(PackageTypeInitialState());
  final PackageTypeRepositoriesImplementation
  packageTypeRepositoriesImplementation;
  Future<void> getPackagesMethod() async {
    emit(PackageTypeLoadingState());
    final result =
        await packageTypeRepositoriesImplementation.fetchAllPackages();
    result.fold(
      (failure) => emit(
        PackageTypeFailureState(
          errorMessageInCubit: failure.errorMessageInFailuresClass,
        ),
      ),
      (packageTypes) =>
          emit(PackageTypeSuccessState(packageTypeInCubit: packageTypes)),
    );
  }
}
