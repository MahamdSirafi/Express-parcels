import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/service_locator/get_it_service_locator.dart';
import 'package:spl/features/auth/data/repository/auth_repository_implementation.dart';
import 'package:spl/features/auth/presentation/managers/cubits/auth_cubit/auth_cubit.dart';
import 'package:spl/features/auth/presentation/views/forget_password_view.dart';
import 'package:spl/features/auth/presentation/views/login_view.dart';
import 'package:spl/features/auth/presentation/views/register_view.dart';
import 'package:spl/features/auth/presentation/views/reset_password_view.dart';
import 'package:spl/features/auth/presentation/views/success_reset_password_view.dart';
import 'package:spl/features/help_and_faqs/presentation/views/help_and_faqs_view.dart';
import 'package:spl/features/home/data/repository/home_repository_implementation.dart';
import 'package:spl/features/home/presentation/managers/cubits/home_cubit/track_button_cubit.dart';
import 'package:spl/features/home/presentation/views/home_view.dart';
import 'package:spl/features/my_ratings/presentation/views/my_ratings_view.dart';
import 'package:spl/features/my_shipment/presentation/views/my_shipment_view.dart';
import 'package:spl/features/packages/data/repositories/package_type_repositories_implementation.dart';
import 'package:spl/features/packages/presentation/managers/cubits/package_type_cubit/package_type_cubit.dart';
import 'package:spl/features/packages/presentation/views/packages_type_view.dart';
import 'package:spl/features/policy/presentation/views/privacy_and_policy_view.dart';
import 'package:spl/features/profile/data/repository/edit_profile_repository_implementation.dart';
import 'package:spl/features/profile/presentation/managers/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:spl/features/profile/presentation/managers/cubits/edit_profile_image_cubit/edit_profile_image_cubit.dart';
import 'package:spl/features/profile/presentation/views/edit_profile_button_view.dart';
import 'package:spl/features/service_center_details/data/repositories/service_center_details_repository_implementation.dart';
import 'package:spl/features/service_center_details/presentation/managers/cubits/service_center_details_cubit/service_center_details_cubit.dart';
import 'package:spl/features/service_center_details/presentation/views/service_center_details_view.dart';
import 'package:spl/features/service_centers/data/repositories/service_centers_repository_implmentation.dart';
import 'package:spl/features/service_centers/presentation/managers/cubits/service_centers_cubit/service_centers_cubit.dart';
import 'package:spl/features/service_centers/presentation/views/service_center_view.dart';
import 'package:spl/features/service_package_type/data/repositories/service_package_type_repositories_implementation.dart';
import 'package:spl/features/service_package_type/presentation/managers/cubits/service_package_type_cubit/service_package_type_cubit.dart';
import 'package:spl/features/service_package_type/presentation/views/service_package_type_view.dart';
import 'package:spl/features/splash/presentation/views/splash_view.dart';
import 'package:spl/features/track/data/repository/tracking_repository_implementation.dart';
import 'package:spl/features/track/presentation/managers/cubits/tracking_cubit/tracking_cubit.dart';
import 'package:spl/features/track/presentation/views/track_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashViewRouter,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginViewRouter,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => AuthCubit(
                    authRepositoryImplementation:
                        getIt.get<AuthRepositoryImplementation>(),
                  ),
              child: const LoginView(),
            ),
      ),
      GoRoute(
        path: kRegisterViewRouter,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => AuthCubit(
                    authRepositoryImplementation:
                        getIt.get<AuthRepositoryImplementation>(),
                  ),
              child: const RegisterView(),
            ),
      ),
      GoRoute(
        path: kForgetPasswordViewRouter,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => AuthCubit(
                    authRepositoryImplementation:
                        getIt.get<AuthRepositoryImplementation>(),
                  ),
              child: const ForgetPasswordView(),
            ),
      ),
      GoRoute(
        path: kResetPasswordViewRouter,
        builder: (context, state) {
          final token = state.extra as String;
          //state.extra contain on value, i give it when i use pushGoRouter(in ForgetPasswordView)
          return BlocProvider(
            create:
                (context) => AuthCubit(
                  authRepositoryImplementation:
                      getIt.get<AuthRepositoryImplementation>(),
                ),
            child: ResetPasswordView(token: token),
          );
        },
      ),
      GoRoute(
        path: kSuccessResetPasswordViewRouter,
        builder: (context, state) => const SuccessResetPasswordView(),
      ),
      GoRoute(
        path: kHomeViewRouter,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) => TrackButtonCubit(
                        homeRepositoryImplementation:
                            getIt.get<HomeRepositoryImplementation>(),
                      ),
                ),
                BlocProvider(
                  create:
                      (context) => ServiceCentersCubit(
                        serviceCentersRepositoryImplmentation:
                            getIt.get<ServiceCentersRepositoryImplmentation>(),
                      )..getMethodServiceCentersCubit(),
                ),
                BlocProvider(
                  create:
                      (context) => TrackingCubit(
                        trackingRepositoryImplementation:
                            getIt.get<TrackingRepositoryImplementation>(),
                      ),
                ),
                BlocProvider(create: (context) => EditProfileImageCubit()),
              ],
              child: const HomeView(),
            ),
      ),
      GoRoute(
        path: kPrivacyAndPolicyViewRouter,
        builder: (context, state) => const PrivacyAndPolicyView(),
      ),
      GoRoute(
        path: kMyShipmentViewRouter,
        builder: (context, state) => const MyShipmentView(),
      ),
      GoRoute(
        path: kTrackViewRouter,
        builder: (context, state) => const TrackView(),
      ),
      GoRoute(
        path: kEditProfileButtonViewRouter,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => EditProfileCubit(
                    editProfileRepositoryImplementation:
                        getIt.get<EditProfileRepositoryImplementation>(),
                  ),
              child: const EditProfileButtonView(),
            ),
      ),
      GoRoute(
        path: kHelpAndFaqsViewRouter,
        builder: (context, state) => const HelpAndFaqsView(),
      ),
      GoRoute(
        path: kMyRatingsViewRouter,
        builder: (context, state) => const MyRatingsView(),
      ),
      GoRoute(
        path: kServiceCenterViewRouter,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => ServiceCentersCubit(
                    serviceCentersRepositoryImplmentation:
                        getIt.get<ServiceCentersRepositoryImplmentation>(),
                  )..getMethodServiceCentersCubit(),
              child: const ServiceCenterView(),
            ),
      ),
      GoRoute(
        path: kServiceCenterDetailsViewRouter,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => ServiceCenterDetailsCubit(
                    serviceCenterDetailsRepositoryImplementation:
                        getIt
                            .get<
                              ServiceCenterDetailsRepositoryImplementation
                            >(),
                  ),
              child: const ServiceCenterDetailsView(),
            ),
      ),
      GoRoute(
        path: kPackagesTypeViewRouter,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => PackageTypeCubit(
                    packageTypeRepositoriesImplementation:
                        getIt.get<PackageTypeRepositoriesImplementation>(),
                  )..getPackagesMethod(),
              child: const PackagesTypeView(),
            ),
      ),
      GoRoute(
        path: kServicePackageTypeViewRouter,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => ServicePackageTypeCubit(
                    servicePackageTypeRepositoriesImplementation:
                        getIt
                            .get<
                              ServicePackageTypeRepositoriesImplementation
                            >(),
                  )..getServicePackagesMethod(),
              child: const ServicePackageTypeView(),
            ),
      ),
    ],
  );
}
