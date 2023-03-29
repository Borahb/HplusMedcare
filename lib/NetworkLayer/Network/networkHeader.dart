// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import '../app_url.dart';
import '../../Utils/shared_preference.dart';

Future<Map<String, String>> getHeaders(String url) async {
  Map<String, String> header = {};
  if (url == AppUrl.login || url == AppUrl.signup) {
    header["Content-Type"] = "application/json";
  } else {
    String? token = await SharedPrefSingleton().getAccessToken();
    if (token != null) {
      debugPrint(token);
      header["Authorization"] = 'Bearer $token';
    }
    header["Content-Type"] = "application/json";
  }
  return header;
}
