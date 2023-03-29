import 'package:flutter/material.dart';
import 'package:hplusmedcare/Screens/PaymentScreen/paymentscreen.dart';
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
    return TextButton(
    style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.0),
    )),
    foregroundColor: MaterialStateProperty.all<Color>(colors.dotcolor),
    backgroundColor: MaterialStateProperty.all<Color>(colors.dotcolor) ),
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen(total: total,)));
    },
    child: SizedBox(
    height: 30,
    width: double.infinity,
    child: Center(
    child: Text("Proceed",style: TextStyle(
    fontSize: 14,
    color: colors.textcolor1,
    fontWeight: FontWeight.w700,
        ),),
      ),
    ),
      );
  }
}