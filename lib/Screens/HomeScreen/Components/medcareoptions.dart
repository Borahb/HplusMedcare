import 'package:flutter/material.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Medcareoptions extends StatelessWidget {
  const Medcareoptions({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(   
      children: [
        Container(
          width: 90,
          height:94,
          decoration:BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(6),
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
            padding: const EdgeInsets.all(10),
            child: Column(
            children: [
            Row(
              children: [
              const Spacer(),
              CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blueAccent[100],
              child: Center(
              child:Image.asset('images/Pill.png',height: 16,width: 16,)
              ),
              )
              ],
            ),
            const Spacer(),
            Text('Claim or prescription' , style: TextStyle(
            fontSize: 13,
            color: colors.textcolor1,
            fontWeight: FontWeight.w400,
        ),
        )
              ]
            ),
          ),
        ),

        const Spacer(),

        Container(
          width: 90,
          height:94,
          decoration:BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(6),
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
            padding: const EdgeInsets.all(10),
            child: Column(
            children: [
            Row(
            children: [
            const Spacer(),
            CircleAvatar(
            radius: 15,
            backgroundColor: Colors.yellowAccent,
            child: Center(
            child:Image.asset('images/Image.png',height: 16,width: 16,)
            ),
            )
            ],
            ),
            const Spacer(),
            Text('Product picture' , style: TextStyle(
            fontSize: 13,
            color: colors.textcolor1,
            fontWeight: FontWeight.w400,
        ),
        )
              ]
            ),
          ),
        ),
        const Spacer(),

        Container(
          width: 90,
          height:94,
          decoration:BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(6),
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
            padding: const EdgeInsets.all(10),
            child: Column(
            children: [
            Row(
            children: [
            const Spacer(),
            CircleAvatar(
            radius: 15,
            backgroundColor: Colors.greenAccent[100],
            child: Center(
            child:Image.asset('images/UserFocus.png',height: 16,width: 16,)
            ),
              )
              ],
            ),
            const Spacer(),
            Text('Pharmacist assistant' , style: TextStyle(
            fontSize: 13,
            color: colors.textcolor1,
            fontWeight: FontWeight.w400,
        ),
        )
              ]
            ),
          ),
        ),
        
      ]
    );
  }
}