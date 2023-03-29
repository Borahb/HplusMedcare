// ignore_for_file: import_of_legacy_library_into_null_safe, use_build_context_synchronously
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/accountmodel.dart';
import 'package:hplusmedcare/Screens/Account/Components/AddressScreen/address.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import '../../Utils/utils.dart';
import '../../repositories/user_repository.dart';
import 'ViewModel/UserViewModel.dart';


class Account extends StatefulWidget {
  const Account({ Key ?key }) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

  
  final userRepository = UserRepository();
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {

      final userviewmodel = Provider.of<UserViewModel>(context);

        return LoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
        child: Container(
        width: 70,
        height: 60,
        decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(6)
        ),
        child: Center(
        child: CircularProgressIndicator(
        color: colors.dotcolor,
        ),
        ),
        )
        ),

        child: Scaffold(
        body: SafeArea(
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
          //print(AccountModel.accoundata.name);
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
        '• ${AccountModel.accoundata.contact}',
        style: TextStyle(
        fontSize: 13,
        color: colors.textcolor1,
        fontWeight: FontWeight.w400,
        ),
        ),
      
        const SizedBox(width: 10,),
      
        Text(
        '• ${AccountModel.accoundata.email}',
        style: TextStyle(
        fontSize: 13,
        color: colors.textcolor1,
        fontWeight: FontWeight.w400,
        ),
        ),    
        ],
        ),
      
        const SizedBox(height: 10,),
      
        //AccountComp(colors: colors, icon: Icons.shopping_bag, name: 'Orders', ontap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> const Orders())); },),
      
        AccountComp(colors: colors, icon: Icons.card_giftcard,name: 'Refer and Earn',ontap: () {  },),
      
        AccountComp(colors: colors, icon: Icons.notifications, name: 'Notifications',ontap: () {  },),
      
        AccountComp(colors: colors, icon: Icons.location_on, name: 'Manage Address',ontap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> const ManageAddress())); },),
      
        AccountComp(colors: colors, icon: EvaIcons.heart, name: 'Saved for Later',ontap: () {  },),
      
        AccountComp(colors: colors, icon: EvaIcons.headphonesOutline, name: 'Need Help',ontap: () {  },),
      
        const SizedBox(height: 15,),
      
        GestureDetector(
          onTap: ()async{

            Utils.alertDialog(
              'Logout',
              'Are you sure you want to logout?',
              (){ 
                userviewmodel.logout(context);
              }, 
              context);

          },
          child: Row(
          children: [
          Text(
          'Log Out',
          style: TextStyle(
          fontSize: 14,
          color: colors.textcolor2,
          fontWeight: FontWeight.w400,
          ),
                  
          ),
          ],
          ),
        ),
        ],
        ),
        ))
        ),
        );
        }
}



class AccountComp extends StatelessWidget {
  const AccountComp({
    Key? key,
    required this.colors,
    required this.icon,
    required this.name,
    required this.ontap
  }) : super(key: key);

  final AppColors colors;
  final IconData icon;
  final String name;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: ontap ,
        child: Row(
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
        ),
    );
  }
}