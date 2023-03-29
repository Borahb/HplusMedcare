
// ignore_for_file: file_names

abstract class BaseApiService {

  Future<dynamic> getGetApiResponse(String url,Map<String, String> headers,);

  Future<dynamic> getPostApiResponse(String url, dynamic data, Map<String, String> headers);

  Future<dynamic> getPutApiResponse(String url, dynamic data);

  Future<dynamic> getDeleteApiResponse(String url, dynamic data,Map<String, String> headers );


}