import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  final SharedPreferences _sharedPreference;

  SharedPreferenceHelper(this._sharedPreference);

  // // General Methods: ----------------------------------------------------------
  // Future<Tokens?> get authTokens async {
  //   final raw = _sharedPreference.getString(Preferences.auth_tokens);
  //   if (raw != null) {
  //     final json = jsonDecode(raw);
  //     return Tokens.fromJson(json);
  //   }
  //   return null;
  // }

  // Future<bool> saveAuthTokens(Tokens authToken) async {
  //   final json = authToken.toJson();
  //   return _sharedPreference.setString(
  //       Preferences.auth_tokens, jsonEncode(json));
  // }

  // Future<bool> removeAuthTokens() async {
  //   return _sharedPreference.remove(Preferences.auth_tokens);
  // }

  // Future<int> get timezone async {
  //   return _sharedPreference.getInt(Preferences.timezone) ??
  //       DateTime.now().timeZoneOffset.inHours;
  // }

  // Future<bool> saveTimezone(int timezone) async {
  //   return _sharedPreference.setInt(Preferences.auth_tokens, timezone);
  // }

  // removeAll() async {
  //   await removeAuthTokens();
  //   await _sharedPreference.remove(Preferences.timezone);
  // }
}
