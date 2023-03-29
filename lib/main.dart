// ignore_for_file: import_of_legacy_library_into_null_safe
// @dart = 2.12
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hplusmedcare/Screens/Account/Components/AddressScreen/ViewModel/address_view_model.dart';
import 'package:hplusmedcare/Screens/Account/ViewModel/UserViewModel.dart';
import 'package:hplusmedcare/Screens/Cart/ViewModel/cart_view_model.dart';
import 'package:hplusmedcare/Screens/LoginScreen/ViewModel/loginview_model.dart';
import 'package:hplusmedcare/Screens/MedicinedetailScreen/ViewModel/medicinedetail_view_model.dart';
import 'package:provider/provider.dart';
import 'Screens/Explore/ViewModel/explore_view_model.dart';
import 'Screens/OrderScreen/ViewModel/order_view_model.dart';
import 'Screens/HomeScreen/ViewModel/homescreen_view_model.dart';
import 'Screens/PaymentScreen/ViewModel/payment_view_model.dart';
import 'Screens/SignupScreen/ViewModel/signup_view_model.dart';
import 'Screens/SplashSceen/splashscreen.dart';
import 'repositories/user_repository.dart';




void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final userRepository = UserRepository();
  runApp( 
  MyApp(userRepository: userRepository), 
  );
}

class MyApp extends StatelessWidget {

  final UserRepository userRepository;
  const MyApp({Key  ? key, required this.userRepository}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context)=> HomeScreenViewModel(),),

        ChangeNotifierProvider(create:(context)=> OrderViewModel() ,),

        ChangeNotifierProvider(create:(context)=> LoginViewModel(),),

        ChangeNotifierProvider(create:(context)=> SignupViewModel(),),

        ChangeNotifierProvider(create:(context)=> UserViewModel(),),

        ChangeNotifierProvider(create:(context)=> PaymentViewModel(),),

        ChangeNotifierProvider(create:(context)=> AddressViewModel(),),

        ChangeNotifierProvider(create:(context)=> CartViewModel(),),

        ChangeNotifierProvider(create:(context)=> ExploreViewModel(),),

        ChangeNotifierProvider(create:(context)=> MedicineViewModel(),),

      ],
      child: MaterialApp(
        title: 'HplusMedcare',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Rubik',
            primarySwatch: Colors.blue,
            ),
        home: SplashScreen(userRepository: userRepository,),
      ),
    );
  }
}

