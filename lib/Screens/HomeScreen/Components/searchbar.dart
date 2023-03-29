import 'package:flutter/material.dart';
import 'package:hplusmedcare/Screens/Explore/explore.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    Key ?key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Explore()));
      },
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius:BorderRadius.circular(15),
          border: Border.all(color: colors.bordercolor1),
          boxShadow: [
          BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
            Icon(Icons.search,color:colors.dotcolor, size: 23,),
    
            const SizedBox(width:10),
    
            Text('Search for Medicines', style: TextStyle(
              fontSize: 14,
              color: colors.textcolor1,
              fontWeight: FontWeight.w400,
            ),)
          ],),
        ),
      ),
    );
  }
}