
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Screens/Account/account.dart';
import 'package:hplusmedcare/Screens/Explore/explore.dart';
import 'package:hplusmedcare/Screens/HomeScreen/homescreen.dart';
import 'package:hplusmedcare/Screens/Pharmacy/pharmacy.dart';
import 'package:hplusmedcare/Screens/Support/support.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({ Key? key }) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {

  int _currentindex = 0;
  
  final tabs = [
    HomeScreen(),
    Pharmacy(),
    Explore(),
    Support(),
    Account()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentindex,
        iconSize: 24,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label:'Home',
             

            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.house_siding),
            label:'Pharmacy',
             

            ),

            BottomNavigationBarItem(
            icon:Icon(Icons.search) ,
            label:'Search',
             

            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label:'Support',
             
            ),
                  
            BottomNavigationBarItem(
            icon: Icon(Icons.person,),
            label:'Account',
             

            ),

        ],
        onTap: (index){
            setState(() {
              _currentindex = index;
            });
        },
      ),

      body: tabs[_currentindex]
    );
  }
}