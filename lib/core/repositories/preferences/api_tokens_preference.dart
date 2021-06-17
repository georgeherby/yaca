import 'package:shared_preferences/shared_preferences.dart';

class ApiTokensPreference {
  static const WHALE_API_TOKEN = 'WHALE_API_TOKEN';

  Future<String?> getWhalesApiToken() async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getString(WHALE_API_TOKEN);
  }

  Future removeWhalesApiToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.remove(WHALE_API_TOKEN);
  }

  Future saveWhalesApiToken(String token) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(WHALE_API_TOKEN, token);
  }
}
