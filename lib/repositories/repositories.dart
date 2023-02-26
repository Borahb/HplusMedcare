// ignore_for_file: import_of_legacy_library_into_null_safe


import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hplusmedcare/Utils/app_url.dart';


class UserRepository {
 
  final FlutterSecureStorage storage = const FlutterSecureStorage();
 

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(String phone, String password) async {
    final  response = await http.post(Uri.parse(AppUrl.login), body: {
      "email": phone,
      "password": password,
    });

    var data = jsonDecode(response.body.toString());
    return data["token"];
  }

}