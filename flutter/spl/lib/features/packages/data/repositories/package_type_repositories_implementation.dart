import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/packages/data/repositories/package_type_repositories.dart';
import 'package:spl/features/packages/data/services/package_type_service.dart';
import 'package:spl/features/packages/presentation/managers/models/package_type_model.dart';

class PackageTypeRepositoriesImplementation implements PackageTypeRepositories {
  final PackageTypeService packageTypeService;
  PackageTypeRepositoriesImplementation({required this.packageTypeService});
  @override
  Future<Either<Failures, List<PackageTypeModel>>> fetchAllPackages() async {
    final result = await packageTypeService.getPackageTypes();
    return result.fold((failure) => Left(failure), (response) {
      final data = response.data;
      final doc = data['doc'] as List;
      final packageTypes =
          doc
              .map(
                (packages) =>
                    PackageTypeModel.fromJson(packageTypeJson: packages),
              )
              .toList();
      return Right(packageTypes);
    });
  }
}
