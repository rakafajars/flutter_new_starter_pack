// Mengambil Token User
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getTokenPrefrence() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("token");
}
