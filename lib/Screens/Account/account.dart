// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hplusmedcare/Bloc/auth_bloc/auth_bloc.dart';
import 'package:hplusmedcare/Bloc/auth_bloc/auth_event.dart';
import 'package:hplusmedcare/Models/accountmodel.dart';
import 'package:hplusmedcare/Service/LocalService/local_userinfo_service.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:hplusmedcare/repositories/repositories.dart';


class Account extends StatefulWidget {
  const Account({ Key ?key }) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late AccountModel userinfo;
  bool isLoading = false;
  //final LocalUserInfoService _localuserinfo = LocalUserInfoService();



  userinf()async{
    setState(() {
      isLoading = true;
    });
    userinfo = await UserRepository().userinfo();
    setState(() {
      isLoading = false;
    });
  }



@override
  void initState() {
    //userinf();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    AppColors colors = AppColors();
    return Scaffold(
      body: isLoading ? Center(child:SpinKitFadingCircle(color: colors.dotcolor,)) :SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left:32,right:32,bottom:32,top:18),
          child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Text(
                AccountModel.accoundata.name,
                style: TextStyle(
                fontSize: 17,
                color: colors.textcolor1,
                fontWeight: FontWeight.w800,
                ),
                  ),
            GestureDetector(
              onTap: (){
                print(AccountModel.accoundata.name);
              },
              child: Text(
                  'Edit',
                  style: TextStyle(
                  fontSize: 13,
                  color: colors.dotcolor,
                  fontWeight: FontWeight.w800,
                  ),
                    ),
            ),
              
            
                ],
             ),
            
              const SizedBox(height: 10,),

            Row(
              children: [
            Text(
                '• '+AccountModel.accoundata.contact,
                style: TextStyle(
                fontSize: 13,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                  ),
              const SizedBox(width: 10,),
            Text(
                '• '+AccountModel.accoundata.email,
                style: TextStyle(
                fontSize: 13,
                color: colors.textcolor1,
                fontWeight: FontWeight.w400,
                ),
                  ),
              
            
                ],
            ),

             const SizedBox(height: 10,),

          AccountComp(colors: colors, icon: Icons.shopping_bag, name: 'Orders',),

          AccountComp(colors: colors, icon: Icons.card_giftcard,name: 'Refer and Earn',),

          AccountComp(colors: colors, icon: Icons.notifications, name: 'Notifications',),

          AccountComp(colors: colors, icon: Icons.location_on, name: 'Manage Address',),

          AccountComp(colors: colors, icon: EvaIcons.heart, name: 'Saved for Later',),

          AccountComp(colors: colors, icon: EvaIcons.headphonesOutline, name: 'Need Help',),

          const SizedBox(height: 15,),

          Row(
            children: [
              GestureDetector(
                onTap: (){
                  BlocProvider.of<AuthenticationBloc>(context).add(
                          LoggedOut(),
                        );
                },
                child: Text(
                      'Log Out',
                      style: TextStyle(
                      fontSize: 14,
                      color: colors.textcolor2,
                      fontWeight: FontWeight.w400,
                      ),
                      
                        ),
              ),
            ],
          ),


            

          ],
      ),
        ))
    );
  }
}

class AccountComp extends StatelessWidget {
  const AccountComp({
    Key? key,
    required this.colors,
    required this.icon,
    required this.name
  }) : super(key: key);

  final AppColors colors;
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
      
      Padding(
        padding: const EdgeInsets.only(top:15,bottom:13),
        child: Row(
          children: [
            Icon(icon,color: colors.dotcolor),
            const SizedBox(width: 15,),
            Text(
                name,
                style: TextStyle(
                fontSize: 15,
                color: colors.textcolor1,
                fontWeight: FontWeight.w500,
                ),
                  ),
          ],
        ),
      ),
      const Spacer(),
      Icon(Icons.arrow_forward_ios,color: colors.dotcolor,size: 23,),
      
        
      
          ],
      );
  }
}