// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:hplusmedcare/Utils/app_url.dart';
import 'package:http/http.dart' as http;




class RemoteMedicineService{

//get all medicine
  Future<dynamic> get(int pageSize,int pagen) async {
    var response = await http.get(
      Uri.parse(AppUrl.medicineurl + '?pageSize=$pageSize&pagen=$pagen')
    );

    return response;  
  }
//search medicine
  Future<dynamic> getMedicine(String name,int pageSize,int pagen) async {
    var response = await http.get(
      Uri.parse(AppUrl.medicineurl + '?medicinename=$name&pageSize=$pageSize&pagen=$pagen')
    );

    return response;  
  }


}