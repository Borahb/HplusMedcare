import 'package:flutter/material.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class BottomtotalPriceSheet extends StatelessWidget {
  const BottomtotalPriceSheet({
    Key? key,
    required this.colors,
    required this.total,
  }) : super(key: key);

  final AppColors colors;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: colors.textcolor2))
          ),
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children:[
                Text('₹$total', style: TextStyle(
                          color: colors.textcolor1,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),),
                const Spacer(),
                GestureDetector(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.70,
                  decoration: BoxDecoration(
                    color: colors.dotcolor,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: Text("Proceed",style: TextStyle(
                            fontSize: 14,
                            color: colors.textcolor1,
                            fontWeight: FontWeight.w700,
                    ),),
                  ),
                ),
              )
                
              ]
            ),
          ),
        );
  }
}