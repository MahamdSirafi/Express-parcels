import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/service_package_type/data/repositories/service_package_type_repositories.dart';
import 'package:spl/features/service_package_type/data/services/service_package_type_services.dart';
import 'package:spl/features/service_package_type/presentation/managers/models/service_package_type_model.dart';

class ServicePackageTypeRepositoriesImplementation
    implements ServicePackageTypeRepositories {
  final ServicePackageTypeServices servicePackageTypeServices;
  ServicePackageTypeRepositoriesImplementation({
    required this.servicePackageTypeServices,
  });
  @override
  Future<Either<Failures, List<ServicePackageTypeModel>>>
  fetchServicePackageType() async {
    final result = await servicePackageTypeServices.getServicePackageType();
    return result.fold((failure) => Left(failure), (response) {
      final data = response.data;
      final doc = data['doc'] as List;
      final servicePackageTypes =
          doc
              .map(
                (packages) => ServicePackageTypeModel.fromJson(
                  servicePackageType: packages,
                ),
              )
              .toList();
      return Right(servicePackageTypes);
    });
  }
}
