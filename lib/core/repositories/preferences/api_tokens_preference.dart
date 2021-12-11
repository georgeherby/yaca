// 📦 Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class ApiTokensPreference {
  static const whaleApiToken = 'WHALE_API_TOKEN';

  Future<String?> getWhalesApiToken() async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getString(whaleApiToken);
  }

  Future removeWhalesApiToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.remove(whaleApiToken);
  }

  Future saveWhalesApiToken(String token) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(whaleApiToken, token);
  }
}
