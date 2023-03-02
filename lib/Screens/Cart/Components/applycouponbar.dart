import 'package:flutter/material.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Applycouponbar extends StatelessWidget {
  const Applycouponbar({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: colors.dotcolor)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Apply Coupon' ,style: TextStyle(
                          color: colors.dotcolor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        ),),
          Icon(Icons.arrow_forward_ios,size: 20,color: colors.dotcolor,)
          ],),
      )
    );
  }
}