import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hplusmedcare/Screens/Explore/Components/medcard.dart';
import 'package:hplusmedcare/Screens/Explore/Components/medproductview.dart';
import 'package:hplusmedcare/Screens/MedicinedetailScreen/meddetailscreen.dart';
import 'package:hplusmedcare/Service/LocalService/local_medicine_service.dart';
import 'package:hplusmedcare/Service/RemoteService/remote_medicine.dart';
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/medicinemodel.dart';
import 'package:hplusmedcare/Utils/colors.dart';



class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  
  AppColors colors = AppColors();
  final LocalMedicineService _localMedicineService = LocalMedicineService();
  List<Medicine> _foundmedicine = [];
  int perPage  = 10;
  int present = 0;

  loadMedData() async {
    // assigning local medicine data before api call
    if (_localMedicineService.getMedicines().isNotEmpty) {
      MedicineModel.medicines = _localMedicineService.getMedicines();
    }
    //call api
    var meddata = await RemoteMedicineService().get();
    if (meddata != null) {
      final decodeddata = jsonDecode(meddata.body.toString());
      var medicine = decodeddata["medicine"];
      MedicineModel.medicines = List.from(medicine)
          .map<Medicine>((item) => Medicine.fromMap(item))
          .toList();

      //save api result in local db
      _localMedicineService.assignAllMedicines(
          medicines: List.from(medicine)
              .map<Medicine>((item) => Medicine.fromMap(item))
              .toList());
        
     // print(MedicineModel.medicines.length);
    }
  }
  
  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Medicine> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _foundmedicine;
    } else {
      results = _foundmedicine
          .where((med) =>
              med.Name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();

      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundmedicine = results;
      _foundmedicine.addAll(_foundmedicine.getRange(present, present + perPage));
    });
  }

  @override
  void initState() {
    loadMedData();
    setState(() {
        _foundmedicine.addAll(MedicineModel.medicines.getRange(present, present + perPage));
        present = present + perPage;
    });
  
    super.initState();
  }

  void loadmore(){
       setState(() {
      if((present + perPage)> MedicineModel.medicines.length) {
        _foundmedicine.addAll(
        MedicineModel.medicines.getRange(present, MedicineModel.medicines.length));
            } else {
            _foundmedicine.addAll(
        MedicineModel.medicines.getRange(present, present + perPage));
            }
    present = present + perPage;
                });
  }

  @override
  Widget build(BuildContext context) {
  // extract a list of items to show on per page basis

    return (MedicineModel.medicines.isNotEmpty)
        ?  NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels ==
              scrollInfo.metrics.maxScrollExtent) {
            loadmore();
          }
          return true;
        },
          child: Scaffold(
                    body: SafeArea(
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32, top: 18),

                    child: Column(
                      children: [

                      TextField(
                        onChanged: (value) => _runFilter(value),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15),
                          hintText: "Search",
                          suffixIcon: const Icon(Icons.search),
                          // prefix: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Medproductview(present: present, foundmedicine: _foundmedicine, colors: colors),
              
                    ]),
                  )),
                )),
        )
            
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}




