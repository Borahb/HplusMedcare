import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/cartproductmodel.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Totalitemscard extends StatelessWidget {
  const Totalitemscard({
    Key? key,
    required this.cartproduct,
    required this.colors,
  }) : super(key: key);

  final List<CartProduct> cartproduct;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${cartproduct.length} Items in your cart', style: TextStyle(
          color: colors.textcolor2,
          fontSize: 13,
          fontWeight: FontWeight.w500
        ),),
      ],
    );
  }
}