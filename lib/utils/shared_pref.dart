import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Mengambil Token User
  static Future<String> getTokenPrefrence() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("token");
  }
}
