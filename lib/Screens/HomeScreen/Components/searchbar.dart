import 'package:flutter/material.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    Key ?key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(25),
        border: Border.all(color: colors.bordercolor1)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top:16, bottom:16),
        child: Row(
          children: [
          Icon(Icons.search,color:colors.darkmode, size: 20,),

          const SizedBox(width:10),

          Text('Type here to search..', style: TextStyle(
            fontSize: 14,
            color: colors.bordercolor1,
            fontWeight: FontWeight.w400,
          ),)
        ],),
      ),
    );
  }
}