// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:convert';
import 'package:hplusmedcare/Models/addressmodel.dart';
import 'package:hplusmedcare/Utils/app_url.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class RemoteAddressService {

  final FlutterSecureStorage storage = const FlutterSecureStorage();

//Get address

Future<void> getUserAddress() async {

    var token = await storage.read(key: 'token'); 

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(
      Uri.parse(AppUrl.addressurl),headers: requestHeaders
    );

    var data = jsonDecode(response.body)["response"];

    AddressModel.useraddress = List.from(data["address"])
    .map<Addres>((item) => Addres.fromMap(item))
    .toList();

  }

//Add address

Future<bool?> addUserAddress(String name,String phone,String pin,String locality, String address, String citydistrict, String state,String lanmark,String addresstype) async {

    var token = await storage.read(key: 'token'); 

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.post(
      Uri.parse(AppUrl.addressurl),headers: requestHeaders,
      body: jsonEncode({
        "payload":{
        "address":[
        {
          "name":name,
          "mobileNumber":phone,
          "pinCode":pin,
          "locality":locality,
          "address":address,
          "cityDistrictTown":citydistrict,
          "state":state,
          "landmark":lanmark,
          "addressType":addresstype
        }
      ]
      }
      })
    );
    if(response.statusCode == 200){      
      return true;
    }
    else if(response.statusCode == 401){
      null;
    }else{
      null;
    }
    

  }

//remove user address
  Future<bool?> removeCartItem(productId) async {
    var token = await storage.read(key: 'token'); 

    final request = http.Request("DELETE", Uri.parse(AppUrl.addressurl));
    request.headers.addAll(<String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  });
    request.body = jsonEncode({"productId":productId});
    final response = await request.send();


    if(response.statusCode == 200){      
      return true;
    }
    else if(response.statusCode == 401){
      null;
    }else{
      null;
    }

    
  }


}