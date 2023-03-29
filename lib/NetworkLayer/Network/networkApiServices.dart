// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hplusmedcare/NetworkLayer/Network/baseapiServices.dart';
import '../app_exceptions.dart';


class NetworkApiService extends BaseApiService{
  @override
  Future getDeleteApiResponse(String url, data,Map<String, String> headers)async{
    dynamic responseJson;
   try {
      debugPrint(url);
      final response = await http.delete(Uri.parse(url),body: data,headers: headers);
      responseJson = returnResponse(response);
   }on SocketException{
      throw FetchDataException('No Internet Connection');
   }
   return responseJson;
  }

  @override
  Future getGetApiResponse(String url,Map<String, String> headers)async{
   dynamic responseJson;
   try {
      debugPrint(url);
      final response = await http.get(Uri.parse(url),headers:headers );
      responseJson = returnResponse(response);
   }on SocketException{
      throw FetchDataException('No Internet Connection');
   }
   return responseJson;
  }

  @override
  Future getPostApiResponse(String url, data, Map<String, String> headers)async{  
   dynamic responseJson;
   try {
      debugPrint(url);
      //debugPrint(data);
      Response response = await http.post(Uri.parse(url),headers: headers, body: data);
      //debugPrint(response.body);
      responseJson = returnResponse(response);
      //debugPrint(responseJson);
   }on SocketException{
      throw FetchDataException('No Internet Connection');
   }
   //debugPrint("returnresponse3 $responseJson");
   return responseJson;
  }

  @override
  Future getPutApiResponse(String url, data) {
   
    throw UnimplementedError();
  }


  dynamic returnResponse (Response response){
    dynamic responseJson = jsonDecode(response.body);
    //debugPrint("returnresponse $responseJson");
    switch(response.statusCode){
      case 200:
        //debugPrint("returnresponse2 $responseJson");
        return responseJson;
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(responseJson["message"] ??  responseJson.toString());
      case 401:
        throw BadRequestException(responseJson["message"] ??  responseJson.toString());
      case 404:
        throw UnAuthorisedException(responseJson["message"] ??  responseJson.toString());
      default:
        throw FetchDataException('Error occured while communication with server with status code ${response.statusCode}');
    }
  }

}