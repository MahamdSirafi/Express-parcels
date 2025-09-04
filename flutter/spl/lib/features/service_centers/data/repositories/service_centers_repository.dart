import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/service_centers/presentation/managers/models/service_centers_model.dart';

abstract class ServiceCentersRepository {
  Future<Either<Failures, List<ServiceCentersModel>>> getServiceCenters();
}
