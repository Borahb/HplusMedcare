
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hplusmedcare/Screens/main_screen/Components/categorygridview.dart';
import 'package:hplusmedcare/Screens/main_screen/Components/medcareoptions.dart';
import 'package:hplusmedcare/Screens/main_screen/Components/searchbar.dart';
import 'package:hplusmedcare/Utils/colors.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(icon: Icon(EvaIcons.logOutOutline), onPressed: () {
      //       BlocProvider.of<AuthenticationBloc>(context).add(
      //                     LoggedOut(),
      //                   );
      //     })
      //   ],
      // ),
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
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor:colors.white ,
                            child: Icon(Icons.notifications)
                          ),
                          const SizedBox(width:10),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor:colors.white ,
                            child: Icon(Icons.shopping_cart)
                          ),
                        ],
                      )

                    ],
                  ),

                  const SizedBox(height: 42,),

                  Row(
                    children: [
                      Text('Hi, Ben ' , style: TextStyle(
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





