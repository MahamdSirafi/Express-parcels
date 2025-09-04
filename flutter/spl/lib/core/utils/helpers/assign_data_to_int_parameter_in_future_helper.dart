import 'package:spl/core/utils/classes/local_database/doubles_shared_preferences_class.dart';

Future<int?> assignDataToIntParameterInFutureHelper({
  required int? ratings,
}) async {
  ratings =
      await DoublesSharedPreferencesClass.getRateMethodSharedPreferences();
  return ratings;
}
