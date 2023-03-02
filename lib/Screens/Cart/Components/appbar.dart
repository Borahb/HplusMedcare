import 'package:flutter/material.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios,size: 20,)),

          const SizedBox(width: 15,),

          Text(
              'Your Cart',
              style: TextStyle(
              fontSize: 17,
              color: colors.textcolor1,
              fontWeight: FontWeight.w800,
              ),
                ),
          
      ],
    );
  }
}