import 'package:shared_preferences/shared_preferences.dart';

abstract class BoolSharedPreferencesClass {
  static Future<void> saveBoolParameterSharedPreferences({
    required String keyBool,
    required bool parameterBool,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(keyBool, parameterBool);
  }

  static Future<bool?> getBoolParameterSharedPreferences({
    required String keyBool,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(keyBool);
  }
}
