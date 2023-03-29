// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/cartproductmodel.dart';
import 'package:hplusmedcare/NetworkLayer/app_url.dart';
import '../NetworkLayer/Network/baseapiServices.dart';
import '../NetworkLayer/Network/networkApiServices.dart';
import '../NetworkLayer/Network/networkHeader.dart';
import 'package:http/http.dart' as http;



class RemoteCartService {

  final BaseApiService _apiServices = NetworkApiService();
  
//get cart 
  Future<List<CartProduct>> getCart() async {

   try{
    Map<String, String> headers = await getHeaders(AppUrl.carturl);
    dynamic response = await _apiServices.getGetApiResponse(
      AppUrl.carturl,headers
    );
    //debugPrint("cart1 $response");
    response = response["response"];
    response = response["products"];
    //debugPrint("cart2 $response");
    List <CartProduct> cartproduct  = List.from(response)
    .map<CartProduct>((item) => CartProduct.fromMap(item))
    .toList();
    //debugPrint("cart2 $cartproduct");
    return cartproduct;
   }catch(e){
    rethrow;
   }
    
  }

//add cart item
  Future<String> addCartItem(String productId, int qty) async {

    try{
      Map<String, String> headers = await getHeaders(AppUrl.carturl);
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.carturl,
        jsonEncode({
          "products":
              {
                "product":productId,
                "qty":qty
              }
        }),headers
      );
      response = response["orders"];
      return response["cartId"].toString();
    }catch(e){
      rethrow;
    }

  }

//remove cart item
  Future<String> removeCartItem(String productId) async {

    try{
      Map<String, String> headers = await getHeaders(AppUrl.carturl);
      
      //String? token = await SharedPrefSingleton().getAccessToken();

      final request = http.Request("DELETE", Uri.parse(AppUrl.carturl));
      request.headers.addAll(headers);
      request.body = jsonEncode({"productId":productId});
      final response = await request.send();

      return response.toString();
    }catch(e){
      rethrow;
    }


  }

//init cart
Future<dynamic> initCart() async {
    //  String? token = await SharedPrefSingleton().getAccessToken();

    //  Map<String, String> requestHeaders = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $token'
    // };

    // var response = await http.post(
    //   Uri.parse(AppUrl.initcarturl),headers: requestHeaders
    // );

    // var data = jsonDecode(response.body);
    // return data;

    try {
      var body = jsonEncode({});
      Map<String, String> headers = await getHeaders(AppUrl.initcarturl);
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.initcarturl,body,headers);
      debugPrint("response $response");
      return response;
    }catch(e){
      rethrow;
    }
  }


}



