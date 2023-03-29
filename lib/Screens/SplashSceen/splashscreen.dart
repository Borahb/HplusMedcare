// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hplusmedcare/Screens/OnboardingScreen/onboardingScreen.dart';
import '../../Models/accountmodel.dart';
import '../../repositories/address_repository.dart';
import '../../Utils/shared_preference.dart';
import '../../repositories/user_repository.dart';
import '../Tabbar/tabbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.userRepository});
  final UserRepository userRepository; 
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset(
    'images/logo.png',
    width: 72.0,
    height: 72.0,
    fit: BoxFit.cover,
    ),
    const SizedBox(height: 70,),
    const CircularProgressIndicator()
    ],
    ),
          
    ),
    ));
    }


    startTime() async {
    await Hive.openBox<AccountModel>('Userinfo');
    String? accessToken = await SharedPrefSingleton().getAccessToken();
    if(accessToken != null && accessToken != ''){
    AccountModel.accoundata = await UserRepository().userinfo();
    await RemoteAddressService().getUserAddress();
    }
    //await Future.delayed(const Duration(seconds: 2));
    goToLoginScreen(accessToken);
    }

    goToLoginScreen(String? accessToken) async {

    if (accessToken != null && accessToken != '') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Tabbar()));
    }
    else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnboardingScreen(userRepository: widget.userRepository,)));
    }
}
}


