// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/addressmodel.dart';
import 'package:hplusmedcare/NetworkLayer/app_url.dart';
import 'package:http/http.dart' as http;
import '../NetworkLayer/Network/baseapiServices.dart';
import '../NetworkLayer/Network/networkApiServices.dart';
import '../NetworkLayer/Network/networkHeader.dart';
import '../Utils/shared_preference.dart';


class RemoteAddressService {

final BaseApiService _apiServices = NetworkApiService();

//Get address

Future<void> getUserAddress() async {


    try {

      Map<String, String> headers = await getHeaders(AppUrl.addressurl);
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.addressurl,headers);
      debugPrint("response1 ${response["response"]}");
      response = response["response"];
      AddressModel.useraddress = List.from(response["address"])
      .map<Addres>((item) => Addres.fromMap(item))
      .toList();


    }catch(e){
      rethrow;
    }


  }

//Add address

Future<String> addUserAddress(String name,String phone,String pin,String locality, String address,String addresstype) async {

    try {
      var body = jsonEncode({
        "payload":{
        "address":[
        {
          "name":name,
          "mobileNumber":phone,
          "pinCode":pin,
          "locality":locality,
          "address":address,
          "addressType":addresstype
        }
      ]
      }
      });

      Map<String, String> headers = await getHeaders(AppUrl.addressurl);
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.addressurl,body,headers);
      debugPrint("response1 ${response["address"]}");
      response = response["address"];
      return response["_id"].toString();


    }catch(e){
      rethrow;
    }
    
    
  }

//Add address

Future<String> editUserAddress(String id,String name,String phone,String pin,String locality, String address,String addresstype) async {

    try{

    Map<String, String> headers = await getHeaders(AppUrl.addressurl);

    dynamic response = await _apiServices.getPostApiResponse(
      AppUrl.addressurl,
      jsonEncode({
        "payload":{
        "address":
        {
          "_id":id,
          "name":name,
          "mobileNumber":phone,
          "pinCode":pin,
          "locality":locality,
          "address":address,
          "addressType":addresstype
        }
      }
      }),headers
    );
    response = response["address"];
    return response["_id"];
    
    }catch (e){
      rethrow;
    }
    

  }

//remove user address
Future<bool?> removeUserAddress(String addid) async {


    String? token = await SharedPrefSingleton().getAccessToken();

    final request = http.Request("DELETE", Uri.parse(AppUrl.addressurl));
    request.headers.addAll(<String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  });
    request.body = jsonEncode({
        "payload":{
        "address":
        {
          "_id" : addid
        }
      
      }
      });
    final response = await request.send();


    if(response.statusCode == 200){      
      return true;
    }
    
  }

//init address
Future<dynamic> initUserAddress() async {


  try {
      var body = jsonEncode({});
      Map<String, String> headers = await getHeaders(AppUrl.initaddressurl);
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.initaddressurl,body,headers);
      debugPrint("response $response");
      return response;

    }catch(e){
      rethrow;
    }


  }


}