import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:hplusmedcare/Controllers/explorecontroller.dart';
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

  void loadMedData() async {
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

      setState(() {});
    }
  }

  List<Medicine> _foundmedicine = [];

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Medicine> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = MedicineModel.medicines;
    } else {
      results = MedicineModel.medicines
          .where((med) =>
              med.Name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();

      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundmedicine = results;
    });
  }

  @override
  void initState() {
    loadMedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (MedicineModel.medicines.isNotEmpty)
        ?  Scaffold(
                  body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, bottom: 32, top: 18),
                  child: Column(children: [
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

                  _foundmedicine.isNotEmpty ? GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 12,
                        mainAxisExtent: 275,
                      ),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder:(context)=> ProductDetailScreen(
                              //     product: ProductModel.products[index],
                              //     index: index,
                              //     )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      children: [

                                  Image.asset('images/medicine.png',width: 120,height: 80,),
                                  const SizedBox(height: 8,),    
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                      _foundmedicine[index].Name,
                                      style: TextStyle(
                                              fontSize: 14,
                                              color: colors.textcolor1,
                                              fontWeight: FontWeight.w800,
                                      ),
                                                                  ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5,),  
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                      'BY ${_foundmedicine[index].Manufacturer_name.toUpperCase()}',
                                      style: TextStyle(
                                              fontSize: 10,
                                              color: colors.textcolor2,
                                              fontWeight: FontWeight.w400,
                                      ),
                                                                  ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5,),  
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                      _foundmedicine[index].Pack_size_label.toUpperCase(),
                                      style: TextStyle(
                                              fontSize: 10,
                                              color: colors.textcolor1,
                                              fontWeight: FontWeight.w400,
                                      ),
                                                                  ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 19,),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                      'MRP',
                                      style: TextStyle(
                                              fontSize: 10,
                                              color: colors.textcolor2,
                                              fontWeight: FontWeight.w400,
                                      ),
                                                                  ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                    '₹ ${_foundmedicine[index].Price}' ,
                                    style: TextStyle(
                                            fontSize: 14,
                                            color: colors.textcolor1,
                                            fontWeight: FontWeight.w800,
                                    ),
                              ),
                                  ],
                                ),
                                      ],
                                    ),
                                  )),
                            ));
                      },
                    ) : Center(child: Text('Not Found'),)
                  ]),
                )),
              ))
            
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
