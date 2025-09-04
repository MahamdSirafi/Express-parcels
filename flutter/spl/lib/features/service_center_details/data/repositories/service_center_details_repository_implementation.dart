import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/service_center_details/data/repositories/service_center_details_repository.dart';
import 'package:spl/features/service_center_details/data/services/service_center_details_services.dart';
import 'package:spl/features/service_center_details/presentation/managers/models/service_center_details_model.dart';

class ServiceCenterDetailsRepositoryImplementation
    implements ServiceCenterDetailsRepository {
  final ServiceCenterDetailsServices serviceCenterDetailsServices;
  ServiceCenterDetailsRepositoryImplementation({
    required this.serviceCenterDetailsServices,
  });

  @override
  Future<Either<Failures, List<ServiceCenterDetailsModel>>>
  getServiceCenterDetails() async {
    final result = await serviceCenterDetailsServices.getServiceCenterDetails(
      path: '/serviceCenters',
    );
    return result.fold((failure) => Left(failure), (serviceCenters) {
      try {
        final List<dynamic> data = serviceCenters.data['doc'] ?? [];
        final productServiceCenters =
            data
                .map(
                  (product) => ServiceCenterDetailsModel.fromJson(
                    serviceCentersJson: product,
                  ),
                )
                .toList();
        //you should use .toList(until type data parameter is List), but .map(return object enable to repeat so it's returns an iterable, not a list)
        return Right(productServiceCenters);
      } on Exception catch (e) {
        return Left(ErrorServer(errorMessageInFailuresClass: e.toString()));
      }
    });
  }
}
