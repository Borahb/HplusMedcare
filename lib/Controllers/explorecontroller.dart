import 'dart:convert';
import 'package:hplusmedcare/Models/medicinemodel.dart';
import 'package:hplusmedcare/Service/LocalService/local_medicine_service.dart';
import 'package:hplusmedcare/Service/RemoteService/remote_medicine.dart';

class ExploreController {


  final LocalMedicineService _localMedicineService = LocalMedicineService();


  void loadMedData ()async{ 
    // assigning local medicine data before api call
    if(_localMedicineService.getMedicines().isNotEmpty){
      MedicineModel.medicines = _localMedicineService.getMedicines();
    }
    //call api 
    var meddata = await RemoteMedicineService().get();
    if(meddata != null){

      final decodeddata = jsonDecode(meddata.body.toString());
      var medicine = decodeddata["medicine"];
      MedicineModel.medicines =  List.from(medicine)
      .map<Medicine>((item) => Medicine.fromMap(item)).toList();

      //save api result in local db
      _localMedicineService.assignAllMedicines(medicines:List.from(medicine)
      .map<Medicine>((item) => Medicine.fromMap(item)).toList());
    } 

    //  _initlocalmedicinedb() async {
    //    await _localMedicineService.init();
    //  }
  

  
  }





}