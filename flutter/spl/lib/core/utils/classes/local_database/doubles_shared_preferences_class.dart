import 'package:shared_preferences/shared_preferences.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';

abstract class DoublesSharedPreferencesClass {
  //shared_preferences package like hive so it's local database but shared_preferences we use it for small save(like strings(JWT tokens), booleans(dark mode), or integers(user score)) but hive for small and big save
  static Future<void> saveRateMethodSharedPreferences({
    required int rate,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    //this line(SharedPreferences.getInstance();) like openBox in hive, so i create or open thing to start storage in it
    await sharedPreferences.setInt(kIntKeyInSharedPreferences, rate);
    //setInt: so this key(left side) the value it is(right side)
  }

  static Future<int?> getRateMethodSharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    //this line(SharedPreferences.getInstance();) like openBox in hive, so i create or open thing to start storage in it
    return sharedPreferences.getInt(kIntKeyInSharedPreferences);
    //getInt: to get on value and just i need to give it key for this value
  }

  static Future<void> clearRateMethodSharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    //this line(SharedPreferences.getInstance();) like openBox in hive, so i create or open thing to start storage in it
    await sharedPreferences.remove(kIntKeyInSharedPreferences);
    //remove: i delete token and i will give you key for this token to delete it, and this useful when you logout from email so you should delete this token(i mean you don't need to still save this token)
  }
}
