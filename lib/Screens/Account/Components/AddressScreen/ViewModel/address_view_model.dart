import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../../NetworkLayer/app_exceptions.dart';
import '../../../../../repositories/address_repository.dart';
import '../address.dart';






class AddressViewModel extends ChangeNotifier{

final addressRepo = RemoteAddressService();
bool loading = false;

Future<void> addUserAddress(String name,String phone,String pin,String locality, String address,String addresstype,BuildContext context)async{
  
  context.loaderOverlay.show();

  await addressRepo.addUserAddress(name, phone, pin, locality, address, addresstype).then((value){

    debugPrint(value);
    context.loaderOverlay.hide();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ManageAddress()));

  }).onError((AppException error, stackTrace){
    context.loaderOverlay.hide();
    if (error.toString() == 'Password not valid') {
      debugPrint(error.toString());
      } else if (error.toString() == 'User not registered') {
      debugPrint(error.toString());
      } else {
        debugPrint(error.toString());
      }
  }) ;


}




Future<void> editUserAddress(String id,String name,String phone,String pin,String locality, String address,String addresstype,BuildContext context)async{
  
  context.loaderOverlay.show();

  await addressRepo.editUserAddress(id, name, phone, pin, locality, address, addresstype).then((value){

    debugPrint(value);
    context.loaderOverlay.hide();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ManageAddress()));

  }).onError((AppException error, stackTrace){
    context.loaderOverlay.hide();
    if (error.toString() == 'Password not valid') {
      debugPrint(error.toString());
      } else if (error.toString() == 'User not registered') {
      debugPrint(error.toString());
      } else {
        debugPrint(error.toString());
      }
  }) ;


}

Future<void> getUserAddress()async{
  loading = true;
  notifyListeners();

  await addressRepo.getUserAddress().then((value){
    loading = false;
    notifyListeners();

  }).onError((AppException error, stackTrace){
    loading = false;
    notifyListeners();
    if (error.toString() == 'Password not valid') {
      debugPrint(error.toString());
      } else if (error.toString() == 'User not registered') {
      debugPrint(error.toString());
      } else {
        debugPrint(error.toString());
      }
  });

}



Future<void> removeUserAddress(String id,BuildContext context)async{

  context.loaderOverlay.show();

  await addressRepo.removeUserAddress(id).then((value){
  context.loaderOverlay.hide();
  getUserAddress();
  }).onError((AppException error, stackTrace){
    context.loaderOverlay.hide();
    if (error.toString() == 'Password not valid') {
      debugPrint(error.toString());
      } else if (error.toString() == 'User not registered') {
      debugPrint(error.toString());
      } else {
        debugPrint(error.toString());
      }
  });

}





}