import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefKeys {
 static  const String accessToken = "ACCESS_TOKEN";
 static const String refreshToken = "REFRESH_TOKEN";
}


class SharedPrefSingleton {
  static final SharedPrefSingleton _singleton = SharedPrefSingleton._internal();

  factory SharedPrefSingleton() {
    return _singleton;
  }

  SharedPrefSingleton._internal();

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.accessToken);
  }


  putAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedPrefKeys.accessToken, accessToken);
  }
  Future<String?> getRefreshAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.refreshToken);
  }


  putRefreshAccessToken(String refreshToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedPrefKeys.refreshToken, refreshToken);
  }

  clearSharedPreferenceLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
