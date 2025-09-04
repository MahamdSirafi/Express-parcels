import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spl/features/auth/data/repository/auth_repository_implementation.dart';
import 'package:spl/features/auth/data/services/auth_services.dart';
import 'package:spl/features/help_and_faqs/data/repositories/help_and_faqs_repository_implementation.dart';
import 'package:spl/features/help_and_faqs/data/services/help_and_faqs_services.dart';
import 'package:spl/features/home/data/repository/home_repository_implementation.dart';
import 'package:spl/features/home/data/services/home_services.dart';
import 'package:spl/features/my_shipment/data/repository/send_ratings_repository_implementation.dart';
import 'package:spl/features/my_shipment/data/services/send_ratings_services.dart';
import 'package:spl/features/packages/data/repositories/package_type_repositories_implementation.dart';
import 'package:spl/features/packages/data/services/package_type_service.dart';
import 'package:spl/features/profile/data/repository/edit_profile_repository_implementation.dart';
import 'package:spl/features/profile/data/services/edit_profile_services.dart';
import 'package:spl/features/service_center_details/data/repositories/service_center_details_repository_implementation.dart';
import 'package:spl/features/service_center_details/data/services/service_center_details_services.dart';
import 'package:spl/features/service_centers/data/repositories/service_centers_repository_implmentation.dart';
import 'package:spl/features/service_centers/data/services/service_centers_services.dart';
import 'package:spl/features/service_package_type/data/repositories/service_package_type_repositories_implementation.dart';
import 'package:spl/features/service_package_type/data/services/service_package_type_services.dart';
import 'package:spl/features/track/data/repository/tracking_repository_implementation.dart';
import 'package:spl/features/track/data/services/tracking_services.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerSingleton<AuthRepositoryImplementation>(
    AuthRepositoryImplementation(authServices: AuthServices(dio: Dio())),
  );
  getIt.registerSingleton<HomeRepositoryImplementation>(
    HomeRepositoryImplementation(homeServices: HomeServices(dio: Dio())),
  );
  getIt.registerSingleton<ServiceCentersRepositoryImplmentation>(
    ServiceCentersRepositoryImplmentation(
      serviceCentersServices: ServiceCentersServices(dio: Dio()),
    ),
  );
  getIt.registerSingleton<HelpAndFaqsRepositoryImplementation>(
    HelpAndFaqsRepositoryImplementation(
      helpAndFaqsServices: HelpAndFaqsServices(dio: Dio()),
    ),
  );
  getIt.registerSingleton<TrackingRepositoryImplementation>(
    TrackingRepositoryImplementation(
      trackingServices: TrackingServices(dio: Dio()),
    ),
  );
  getIt.registerSingleton<ServiceCenterDetailsRepositoryImplementation>(
    ServiceCenterDetailsRepositoryImplementation(
      serviceCenterDetailsServices: ServiceCenterDetailsServices(dio: Dio()),
    ),
  );
  getIt.registerSingleton<SendRatingsRepositoryImplementation>(
    SendRatingsRepositoryImplementation(
      sendRatingsServices: SendRatingsServices(dio: Dio()),
    ),
  );
  getIt.registerSingleton<EditProfileRepositoryImplementation>(
    EditProfileRepositoryImplementation(
      editProfileServices: EditProfileServices(dio: Dio()),
    ),
  );
  getIt.registerSingleton<PackageTypeRepositoriesImplementation>(
    PackageTypeRepositoriesImplementation(
      packageTypeService: PackageTypeService(dio: Dio()),
    ),
  );
  getIt.registerSingleton<ServicePackageTypeRepositoriesImplementation>(
    ServicePackageTypeRepositoriesImplementation(
      servicePackageTypeServices: ServicePackageTypeServices(dio: Dio()),
    ),
  );
}
