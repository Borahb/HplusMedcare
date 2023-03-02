import 'package:flutter/material.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Addmoreitem extends StatelessWidget {
  const Addmoreitem({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Add More Items' ,style: TextStyle(
                        color: colors.dotcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),),
        Icon(Icons.add_rounded,size: 20,color: colors.dotcolor,)
      ],
    );
  }
}