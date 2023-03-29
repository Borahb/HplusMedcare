import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../Models/orderModel.dart';
import '../NetworkLayer/Network/baseapiServices.dart';
import '../NetworkLayer/Network/networkApiServices.dart';
import '../NetworkLayer/Network/networkHeader.dart';
import '../NetworkLayer/app_url.dart';



class OrderService {

final BaseApiService _apiServices = NetworkApiService();
//create order
Future<String> createOrder ( 
  String name, 
  String phone, 
  String pin, 
  String locality,      
  String address,
  String addresstype
  )async{

    try {
      var body = jsonEncode({
        "shippingDetails":{
        "name":name,
        "mobileNumber":phone,
        "pinCode":pin,
        "locality":locality,
        "address":address,
        "addressType":addresstype
        }
      });

      Map<String, String> headers = await getHeaders(AppUrl.orderurl);
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.orderurl, body, headers);
      debugPrint("response1 ${response["orders"]}");
      response = response["orders"];
      return response["_id"].toString();


    }catch(e){
      rethrow;
    }
}

//get orders
Future<OrderModel> getOrders()async{


    try {
      Map<String, String> headers = await getHeaders(AppUrl.orderurl);
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.orderurl,headers);
      debugPrint("response1 ${response["response"]}");
      response = response["response"];
      response = OrderModel.fromMap(response);
      return response;

    }catch(e){
      rethrow;
    }

}


//init order
Future<dynamic> initOrders()async{

    try {
      var body = jsonEncode({});
      Map<String, String> headers = await getHeaders(AppUrl.initorderurl);
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.initorderurl,body,headers);
      debugPrint("response $response");
      return response;

    }catch(e){
      rethrow;
    }



    // String? token = await SharedPrefSingleton().getAccessToken();
    // Map<String, String> requestHeaders = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $token'
    // };

    // var response =await http.post(Uri.parse(AppUrl.initorderurl),headers: requestHeaders,);

    // var data = jsonDecode(response.body);

    // return data;

}


}