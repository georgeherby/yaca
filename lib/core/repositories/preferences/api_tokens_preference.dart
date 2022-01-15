// 📦 Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class ApiTokensPreference {
  static const _whaleApiToken = 'WHALE_API_TOKEN';

  Future<String?> getWhalesApiToken() async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getString(_whaleApiToken);
  }

  Future removeWhalesApiToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.remove(_whaleApiToken);
  }

  Future saveWhalesApiToken(String token) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(_whaleApiToken, token);
  }
}
