// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../Models/accountmodel.dart';
import '../../../NetworkLayer/app_exceptions.dart';
import '../../../repositories/order_repository.dart';
import '../../../repositories/address_repository.dart';
import '../../../repositories/cart_repository.dart';
import '../../../Utils/shared_preference.dart';
import '../../../repositories/user_repository.dart';
import '../../Tabbar/tabbar.dart';



class SignupViewModel extends ChangeNotifier{




bool _isLoaderVisible = false;
final userRepo = UserRepository();

Future<void> signup(String email,String phone ,String name,String password,BuildContext context)async{

  context.loaderOverlay.show(); 

  await userRepo.signUp(email, phone, name, password).then((value)async{
  
  debugPrint(value.id);

  await userRepo.login(email, password).then((value){
    SharedPrefSingleton().putAccessToken(value.token);
    debugPrint("token ${value.token}");
  });

    AccountModel.accoundata = await userRepo.userinfo();
    await RemoteAddressService().initUserAddress();
    await OrderService().initOrders();
    await RemoteCartService().initCart();


    context.loaderOverlay.hide();
  
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Tabbar()));

  }).onError((AppException error, stackTrace){

      context.loaderOverlay.hide();

    _isLoaderVisible = context.loaderOverlay.visible;
      notifyListeners();

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