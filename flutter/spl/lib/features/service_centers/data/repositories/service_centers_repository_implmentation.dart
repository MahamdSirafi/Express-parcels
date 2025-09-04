import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/service_centers/data/repositories/service_centers_repository.dart';
import 'package:spl/features/service_centers/data/services/service_centers_services.dart';
import 'package:spl/features/service_centers/presentation/managers/models/service_centers_model.dart';

class ServiceCentersRepositoryImplmentation
    implements ServiceCentersRepository {
  final ServiceCentersServices serviceCentersServices;
  ServiceCentersRepositoryImplmentation({required this.serviceCentersServices});
  @override
  Future<Either<Failures, List<ServiceCentersModel>>>
  getServiceCenters() async {
    final result = await serviceCentersServices.getMethodServiceCentersServices(
      path: '/serviceCenters',
    );
    return result.fold((failure) => Left(failure), (serviceCenters) {
      try {
        final List<dynamic> data = serviceCenters.data['doc'] ?? [];
        final productServiceCenters =
            data
                .map(
                  (product) =>
                      ServiceCentersModel.fromJson(serviceCentersJson: product),
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
