// ignore_for_file: use_build_context_synchronously, file_names
import 'package:flutter/material.dart';
import 'package:hplusmedcare/repositories/user_repository.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../Models/accountmodel.dart';
import '../../../NetworkLayer/app_exceptions.dart';
import '../../../Utils/shared_preference.dart';
import '../../LoginScreen/loginScreen.dart';

class UserViewModel extends ChangeNotifier{

  final userRepo = UserRepository();


  Future<void> userinfo()async{

      await userRepo.userinfo().then((value){
        AccountModel.accoundata = value;
      }).onError((AppException error, stackTrace){
          if (error.toString() == 'Password not valid') {
          debugPrint(error.toString());
          } else if (error.toString() == 'User not registered') {
          debugPrint(error.toString());
      } else {
        debugPrint(error.toString());
      }
      })  ;
  }


  Future<void> logout(BuildContext context)async{

    context.loaderOverlay.show(); 

    await Future.delayed(const Duration(seconds: 1));
    await SharedPrefSingleton().clearSharedPreferenceLogout();

    context.loaderOverlay.hide();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen(userRepository: userRepo,)), (route) => false);

  }

}