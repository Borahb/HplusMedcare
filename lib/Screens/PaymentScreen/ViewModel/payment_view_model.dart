import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../NetworkLayer/app_exceptions.dart';
import '../../../repositories/order_repository.dart';
import '../../OrderComplete/orderComplete.dart';

class PaymentViewModel extends ChangeNotifier{



final orderRepo = OrderService();
  
Future<void> placeorder(String name, 
  String phone, 
  String pin, 
  String locality,      
  String address,
  String addresstype, BuildContext context)async{
    context.loaderOverlay.show(); 

    await orderRepo.createOrder(name, phone, pin, locality, address, addresstype).then((value){
      debugPrint(value);

      context.loaderOverlay.hide();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const OrderComplete()));

    }).onError((AppException error, stackTrace){

      context.loaderOverlay.hide();

      if (error.toString() == "User already registered") {

        debugPrint(error.toString());
      } else if (error.toString() == "User data not valid") {

        debugPrint(error.toString());
      } else {
        debugPrint(error.toString());
      }
  });


}





}