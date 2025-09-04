import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/service_package_type/presentation/managers/models/service_package_type_model.dart';

abstract class ServicePackageTypeRepositories {
  Future<Either<Failures, List<ServicePackageTypeModel>>>
  fetchServicePackageType();
}
