// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hplusmedcare/Models/accountmodel.dart';
import 'package:hplusmedcare/NetworkLayer/app_url.dart';
import '../Models/loginmodel.dart';
import '../Models/signupmodel.dart';
import '../NetworkLayer/Network/baseapiServices.dart';
import '../NetworkLayer/Network/networkApiServices.dart';
import '../NetworkLayer/Network/networkHeader.dart';


class UserRepository {
 
  final BaseApiService _apiServices = NetworkApiService();

  Future<LoginResponseModel> login(String  email, String password)async{
    try{

        var body = jsonEncode({
        "email": email,
        "password":password,
        });
        Map<String, String> headers = await getHeaders(AppUrl.login);
        dynamic response = await _apiServices.getPostApiResponse(AppUrl.login, body, headers);
        response = LoginResponseModel.fromMap(response);
        return response;

    }catch(e){
      rethrow;
    }
  }
  

  Future<AccountModel> userinfo() async {
    try{
        Map<String, String> headers = await getHeaders(AppUrl.userinfo);
        dynamic response = await _apiServices.getGetApiResponse(AppUrl.userinfo, headers);
        response = AccountModel.fromMap(response);
        return response;
    }catch(e){
      rethrow;
    }
  }

  Future<SignupResponseModel> signUp(String email,String phone ,String name,String password) async {
   try{

      var body = jsonEncode({
        "email":email,
        "name":name,
        "contact":phone,
        "password":password,
        });
    Map<String, String> headers = await getHeaders(AppUrl.signup);
    dynamic response = await _apiServices.getPostApiResponse(AppUrl.signup, body, headers);
    debugPrint(" response1 $response");
    response = SignupResponseModel.fromMap(response);
    return response;

   }catch(e){
    rethrow;
   }
   
  }

}