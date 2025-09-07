import 'package:dartz/dartz.dart';
import 'package:spl/core/utils/classes/local_database/strings_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/errors/failures.dart';
import 'package:spl/features/help_and_faqs/data/repositories/help_and_faqs_repository.dart';
import 'package:spl/features/help_and_faqs/data/services/help_and_faqs_services.dart';

class HelpAndFaqsRepositoryImplementation implements HelpAndFaqsRepository {
  final HelpAndFaqsServices helpAndFaqsServices;
  HelpAndFaqsRepositoryImplementation({required this.helpAndFaqsServices});
  @override
  Future<Either<Failures, Map<String, dynamic>>>
  deleteAccountHelpAndFaqsRepository() async {
    final token =
        await StringsSharedPreferencesClass.getTokenMethodSharedPreferences(
          stringKey: kStringKeyTokenInSharedPreferences,
        );
    if (token == null) {
      return Left(
        ErrorServer(errorMessageInFailuresClass: 'Error: there is no token'),
      );
    }
    final result = await helpAndFaqsServices.deleteAccountHelpAndFaqsServices(
      path: '/users/me', //or '/users/customers/:id' if you want
    );
    return result.fold((failure) => Left(failure), (delete) async {
      await StringsSharedPreferencesClass.clearTokenMethodSharedPreferences(
        stringKey: kStringKeyTokenInSharedPreferences,
      );
      return const Right({'message': 'successful, the account was deleted'});
    });
  }
}
