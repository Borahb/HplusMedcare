// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:hplusmedcare/Utils/app_url.dart';
import 'package:http/http.dart' as http;




class RemoteMedicineService {


  Future<dynamic> get() async {
    var response = await http.get(
      Uri.parse(AppUrl.medicineurl)
    );

    return response;  
  }


}