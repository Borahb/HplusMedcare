// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hplusmedcare/Models/cartproductmodel.dart';
import 'package:hplusmedcare/Utils/app_url.dart';
import 'package:http/http.dart' as http;




class RemoteCartService {

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  
//get cart 
  Future<List<CartProduct>> getCart() async {

    var token = await storage.read(key: 'token'); 

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };



    var response = await http.get(
      Uri.parse(AppUrl.carturl),headers: requestHeaders
    );

    var data = jsonDecode(response.body)["response"];

    List<CartProduct> cartproduct = List.from(data["products"])
    .map<CartProduct>((item) => CartProduct.fromMap(item))
    .toList();

    return cartproduct;

    
  }

//add cart item
  Future<bool?> addCartItem(productId, qty) async {

    var token = await storage.read(key: 'token'); 

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };



    var response = await http.post(
      Uri.parse(AppUrl.carturl),headers: requestHeaders,
      body: jsonEncode({
        "products":[
            {
              "product":productId,
              "qty":qty
            }
        ]
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

//remove cart item
  Future<bool?> removeCartItem(productId) async {
    var token = await storage.read(key: 'token'); 

    final request = http.Request("DELETE", Uri.parse(AppUrl.carturl));
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



