import 'package:shared_preferences/shared_preferences.dart';

abstract class StringsSharedPreferencesClass {
  //shared_preferences package like hive so it's local database but shared_preferences we use it for small save(like strings(JWT tokens), booleans(dark mode), or integers(user score)) but hive for small and big save
  static Future<void> saveTokenMethodSharedPreferences({
    required String stringParameter,
    required String stringKey,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    //this line(SharedPreferences.getInstance();) like openBox in hive, so i create or open thing to start storage in it
    await sharedPreferences.setString(stringKey, stringParameter);
    //setString: so this key(left side) the value it is(right side)
  }

  static Future<String?> getTokenMethodSharedPreferences({
    required String stringKey,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    //this line(SharedPreferences.getInstance();) like openBox in hive, so i create or open thing to start storage in it
    return sharedPreferences.getString(stringKey);
    //getString: to get on value and just i need to give it key for this value
  }

  static Future<void> clearTokenMethodSharedPreferences({
    required String stringKey,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    //this line(SharedPreferences.getInstance();) like openBox in hive, so i create or open thing to start storage in it
    await sharedPreferences.remove(stringKey);
    //remove: i delete token and i will give you key for this token to delete it, and this useful when you logout from email so you should delete this token(i mean you don't need to still save this token)
  }
}
