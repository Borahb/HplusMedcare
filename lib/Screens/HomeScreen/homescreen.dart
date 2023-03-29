// ignore_for_file: import_of_legacy_library_into_null_safe, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/accountmodel.dart';
import 'package:hplusmedcare/Screens/Cart/cart.dart';
import 'package:hplusmedcare/Screens/HomeScreen/Components/categorygridview.dart';
import 'package:hplusmedcare/Screens/HomeScreen/Components/medcareoptions.dart';
import 'package:hplusmedcare/Screens/HomeScreen/Components/searchbar.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:badges/badges.dart' as badges;
import '../../Models/addressmodel.dart';
import 'ViewModel/homescreen_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  AppColors colors = AppColors();
  final _homescreenNotifier = HomeScreenViewModel();
  int? initdata = 0;
  
  @override
  void dispose() {
    _homescreenNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
          return Scaffold(
          body: SafeArea(
          child: StreamBuilder(
            stream: _homescreenNotifier.getCart(const Duration(seconds: 1)),
            initialData: initdata,

            builder: (context, stream) {
              // if (stream.connectionState == ConnectionState.done) {
              //   return const Icon(
              //   Icons.check_circle,
              //   color: Colors.green,
              //   size: 20,
              //   );
              // }
              if(stream.hasData){
                  
              return SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.only(left:16,right:16,bottom:32,top:18),
              child: Column(
              children: [
              Row(                   
              children: [
                      
              AddressModel.useraddress.isNotEmpty ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
              'Delivery to',
              style: TextStyle(
              fontSize: 12,
              color: colors.textcolor2,
              fontWeight: FontWeight.w500,
              ),
              ),
                      
              const SizedBox(height: 5,),
              Row(
              children: [
              Text(
              AddressModel.useraddress[AddressModel.selectedaddress].pinCode,
              style: TextStyle(
              fontSize: 14,
              color: colors.textcolor1,
              fontWeight: FontWeight.w600,
              ),
              ),
              const SizedBox(width: 5,),
              Icon(Icons.arrow_drop_down,size: 18, color: colors.textcolor1,),
              ],
              ),
                     
              ],
              ) : Container(),
                      
              const Spacer(),
                      
              Row(
              children: [
              CircleAvatar(
              radius: 20,
              backgroundColor:colors.white ,
              child: const Icon(Icons.notifications)
              ),
              const SizedBox(width:10),
              GestureDetector(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Cart()));
              },
              child: badges.Badge(
              ignorePointer: false,
                    
              badgeContent: Text(stream.data.toString(),style: TextStyle(color: colors.white),),
              child: CircleAvatar(
              radius: 20,
              backgroundColor:colors.white ,
              child: const Icon(Icons.shopping_cart)
              ),
              ),
              ),
              ],
              )
                      
              ],
              ),
                      
              const SizedBox(height: 42,),
                      
              Row(
              children: [
              Text('Hi, ${AccountModel.accoundata.name}' , style: TextStyle(
              fontSize: 18,
              color: colors.textcolor1,
              fontWeight: FontWeight.w500,
              ),
              ),
              ],
              ),
                      
              const SizedBox(height: 10,),
                      
              Row(
              children: [
              Text('Welcome to HplusMedcare' , style: TextStyle(
              fontSize: 20,
              color: colors.textcolor1,
              fontWeight: FontWeight.w400,
              ),
              ),
              ],
              ),
                      
              const SizedBox(height: 25,),
                      
              Searchbar(colors: colors),
                      
              const SizedBox(height: 30,),
                      
              Medcareoptions(colors: colors),
                      
              const SizedBox(height: 35,),
                      
              Row(
              children: [
              Text('Categories' , style: TextStyle(
              fontSize: 18,
              color: colors.textcolor1,
              fontWeight: FontWeight.w700,
              ),
              ),
              ],
              ),
                      
              const SizedBox(height: 14,),
                      
              Categorygridview(colors: colors),
                                            
                      
              ],
              ),
              ),
              );
              }else{
                  return const Center(child:CircularProgressIndicator());
              }

              
            }
          ),
          )
          );
          }
}





