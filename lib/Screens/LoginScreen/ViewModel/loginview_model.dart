// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../Models/accountmodel.dart';
import '../../../NetworkLayer/app_exceptions.dart';
import '../../../Utils/shared_preference.dart';
import '../../../Utils/utils.dart';
import '../../../repositories/address_repository.dart';
import '../../../repositories/user_repository.dart';
import '../../Tabbar/tabbar.dart';

class LoginViewModel extends ChangeNotifier{

  final userRepo = UserRepository();

  Future<void> login(String email, String password,BuildContext context)async{

    context.loaderOverlay.show(); 
   
    await userRepo.login(email,password).then((value)async{
    SharedPrefSingleton().putAccessToken(value.token);
    //debugPrint("token ${value.token}");
    AccountModel.accoundata = await userRepo.userinfo();
    await RemoteAddressService().getUserAddress();
    context.loaderOverlay.hide();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Tabbar()));
    }).onError((AppException error, stackTrace){

        context.loaderOverlay.hide();

      if (error.toString() == 'Password not valid') {
        Utils.flushbarErrorMessage('Password not valid',context);
        debugPrint(error.toString());
      } else if (error.toString() == 'User not registered') {
        Utils.flushbarErrorMessage('User not registered',context);
        debugPrint(error.toString());
      } else {
        Utils.flushbarErrorMessage(error.toString(),context);
        debugPrint(error.toString());
      }
    });

  }




}