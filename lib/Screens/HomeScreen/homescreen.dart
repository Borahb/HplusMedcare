// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/accountmodel.dart';
import 'package:hplusmedcare/Models/cartmodel.dart';
import 'package:hplusmedcare/Screens/Cart/cart.dart';
import 'package:hplusmedcare/Screens/HomeScreen/Components/categorygridview.dart';
import 'package:hplusmedcare/Screens/HomeScreen/Components/medcareoptions.dart';
import 'package:hplusmedcare/Screens/HomeScreen/Components/searchbar.dart';
import 'package:hplusmedcare/Service/RemoteService/remote_cart_service.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  AppColors colors = AppColors();
  getCartItems()async{
    await RemoteCartService().getCart();
    setState(() {
    });
   }
   @override
  void initState() {
    getCartItems();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left:32,right:32,bottom:32,top:18),
            child: Column(
              children: [
                  Row(                   
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor:colors.dotcolor ,
                        child:Image.asset("images/profilepic.png")
                      ),

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
                              
                              badgeContent: Text(CartModel.medicines.length.toString(),style: TextStyle(color: colors.white),),
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
                      Text('Hi, ' + AccountModel.accoundata.name , style: TextStyle(
                        fontSize: 24,
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

                  const SizedBox(height: 18,),

                  Searchbar(colors: colors),

                  const SizedBox(height: 24,),

                  Medcareoptions(colors: colors),

                  const SizedBox(height: 24,),

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
        ),
      )
    );
  }
}





