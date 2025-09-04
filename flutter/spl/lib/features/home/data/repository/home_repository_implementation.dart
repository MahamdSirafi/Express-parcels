import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/classes/local_database/strings_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/home/data/repository/home_repository.dart';
import 'package:spl/features/home/data/services/home_services.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final HomeServices homeServices;
  HomeRepositoryImplementation({required this.homeServices});
  @override
  Future<Either<Failures, bool>> hasTheUserInThePastShipment() async {
    final result = await homeServices.getMethodHomeServices(
      path: '/parcels/mine',
    );
    return result.fold((failure) => Left(failure), (response) {
      final shipments = response.data['doc'] as List?;
      bool areThereShipments = shipments != null && shipments.isNotEmpty;
      //If response.data['doc'] is not empty and not null, so the user has past shipments(true), else, so the user hasn't past shipments(false)
      return Right(areThereShipments);
    });
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>>
  logOutFromEmailRepository() async {
    final result = await homeServices.getMethodHomeServices(
      path: '/users/logout',
    );
    return result.fold((failure) => Left(failure), (logout) async {
      await StringsSharedPreferencesClass.clearTokenMethodSharedPreferences(
        stringKey: kStringKeyInSharedPreferences,
      );
      return Right(logout.data);
    });
  }
}
