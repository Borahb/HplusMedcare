import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../Models/medicinemodel.dart';
import '../../../repositories/medicine_repository.dart';

class ExploreViewModel extends ChangeNotifier{


  final List<Medicine> foundmedicine = [];
  bool isLastPage = false;
  int pageNumber = 0;
  bool error = false ;
  final int _numberOfMedsPerRequest = 10;
  String search = '';
  bool isLoading = false;
  final medicineRepo = RemoteMedicineService();

  Future<void> runFilter(String name,BuildContext context)async{

    
    isLoading = true;
    foundmedicine.clear();
    notifyListeners();


    List<Medicine> results = [];
    var meddata = await RemoteMedicineService().getMedicine(name,_numberOfMedsPerRequest,pageNumber);
    if (meddata != null) {
    final decodeddata = jsonDecode(meddata.body.toString());
    var medicine = decodeddata["medicine"];
    results = List.from(medicine)
    .map<Medicine>((item) => Medicine.fromMap(item))
    .toList();
    
    isLastPage = results.length < _numberOfMedsPerRequest;
    pageNumber = pageNumber + 1;
    foundmedicine.addAll(results);
    isLoading = false;
    notifyListeners();

     
    }

  }




}