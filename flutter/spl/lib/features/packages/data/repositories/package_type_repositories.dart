import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/packages/presentation/managers/models/package_type_model.dart';

abstract class PackageTypeRepositories {
  Future<Either<Failures, List<PackageTypeModel>>> fetchAllPackages();
}
