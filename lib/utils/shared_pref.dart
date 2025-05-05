import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String _tokenKey = 'token';

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    print('Saved Token: $token');
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    print('Retrieved Token: $token');
    return token;
  }
}
