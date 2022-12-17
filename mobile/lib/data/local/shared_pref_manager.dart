import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  final KEY_LOGGED_IN = "logged_in";

  Future<bool> writeLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(KEY_LOGGED_IN, value);
  }

  Future<bool> readLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(KEY_LOGGED_IN) ?? false;
  }
}
