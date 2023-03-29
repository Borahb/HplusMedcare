// ignore_for_file: file_names

import 'dart:async';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';


import '../../Utils/colors.dart';
import '../Tabbar/tabbar.dart';

class OrderComplete extends StatefulWidget {
  const OrderComplete({super.key});

  @override
  State<OrderComplete> createState() => _OrderCompleteState();
}

class _OrderCompleteState extends State<OrderComplete> {

  AppColors colors = AppColors();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
              width: double.infinity,
              height: 200,
              color: Colors.green.shade800,
              child: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(EvaIcons.checkmarkCircle,color: colors.white,size: 30,),
              const SizedBox(height: 10,),
              Text(
              'Order Placed Successfully',
              style: TextStyle(
              fontSize: 17,
              color: colors.white,
              fontWeight: FontWeight.w700,
              ),
              ),
              ],
              ),
              ),
              ),

              const SizedBox(height: 15,),

              // Padding(
              //     padding: const EdgeInsets.only(left: 20, right: 20,),
              //     child: Container(
              //     width: double.infinity,
              //     height: 190,
              //     decoration: BoxDecoration(
              //     color: colors.white,
              //     borderRadius: BorderRadius.circular(6),
              //     border: Border.all(color: colors.textcolor2)
              //     ),
              //     child: Center(
              //     child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //     Container(
              //       height: 50,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //       color: Colors.grey.shade300,
              //       borderRadius: const BorderRadius.only(topLeft:Radius.circular(6.0) ,topRight: Radius.circular(6.0)),
              //       boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.withOpacity(0.5),
              //         spreadRadius: 4,
              //         blurRadius: 6,
              //         offset: const Offset(0, 3), // changes position of shadow
              //       ),
              //       ]
              //       ),
                    
              //       child: Center(
              //       child: Row(
              //       children: [
              //       const SizedBox(width: 20,),
              //       Text(
              //       'Order total',
              //       style: TextStyle(
              //       fontSize: 17,
              //       color: colors.textcolor2,
              //       fontWeight: FontWeight.w400,
              //       ),
              //       ),
              //       const SizedBox(width: 10,),
              //       Text(
              //       'Rs700',
              //       style: TextStyle(
              //       fontSize: 17,
              //       color: colors.textcolor2,
              //       fontWeight: FontWeight.w700,
              //       ),
              //       ),
              //       ],
              //       ),
              //       ),
              //     ),
              //     const SizedBox(height: 20,),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 20, right: 20,),
              //       child: Row(
              //       children: [
              //       Text(
              //       'Shipment 1 .',
              //       style: TextStyle(
              //       fontSize: 17,
              //       color: colors.textcolor2,
              //       fontWeight: FontWeight.w400,
              //       ),
              //       ),
              //       const SizedBox(width: 10,),
              //       Text(
              //       '2 Items',
              //       style: TextStyle(
              //       fontSize: 17,
              //       color: colors.textcolor2,
              //       fontWeight: FontWeight.w400,
              //       ),
              //       ),
              //       const Spacer(),
              //       Text(
              //       'Standard Delivery',
              //       style: TextStyle(
              //       fontSize: 12,
              //       color: colors.textcolor1,
              //       fontWeight: FontWeight.w400,
              //       ),
              //       ),


              //       ],
              //     ),
              //     ),

              //     const SizedBox(height: 40, child: Divider(),),

              //     Padding(
              //       padding: const EdgeInsets.only(left: 20, right: 20,),
              //       child: Column(
              //       children: [
              //       Row(
              //       children: [
              //       Text(
              //       'Order ID .',
              //       style: TextStyle(
              //       fontSize: 13,
              //       color: colors.textcolor2,
              //       fontWeight: FontWeight.w400,
              //       ),
              //       ),
              //       ],
              //       ),
              //       const SizedBox(height: 5,),
              //       Row(
              //       children: [
              //       Text(
              //       '#122334456788990',
              //       style: TextStyle(
              //       fontSize: 13,
              //       color: colors.textcolor2,
              //       fontWeight: FontWeight.w400,
              //       ),
              //       ),
              //       ],
              //       ),
              //         ],
              //       ),
              //     ),

              //     ],
              //     ),
              //     ),
              //   ),
              // ),

              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,),
                child: TextButton(
                style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                )),
                foregroundColor: MaterialStateProperty.all<Color>(colors.dotcolor),
                backgroundColor: MaterialStateProperty.all<Color>(colors.dotcolor) ),
                onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const Tabbar()), (route) => false);
                },
                child: SizedBox(
                height: 30,
                width: double.infinity,
                child: Center(
                child: Text("Back to Home",style: TextStyle(
                fontSize: 14,
                color: colors.white,
                fontWeight: FontWeight.w700,
                    ),),
                  ),
                ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }


}
