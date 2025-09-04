import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/service_center_details/presentation/managers/models/service_center_details_model.dart';

abstract class ServiceCenterDetailsRepository {
  Future<Either<Failures, List<ServiceCenterDetailsModel>>>
  getServiceCenterDetails();
}
