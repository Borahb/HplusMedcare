
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hplusmedcare/Utils/colors.dart';

class Utils {



static toastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.amber,
      toastLength: Toast.LENGTH_SHORT,
      );
  }

  static void flushbarMessage(String message, BuildContext context){

    AppColors colors = AppColors();

    showFlushbar(
    context: context,
    flushbar: Flushbar(
      duration: const Duration(seconds: 2),
      forwardAnimationCurve: Curves.decelerate,
      borderRadius: BorderRadius.circular(6),
      margin: const EdgeInsets.symmetric( horizontal: 20,vertical: 10),
      padding: const EdgeInsets.all(15),
      message: message, 
      backgroundColor: const Color.fromARGB(168, 0, 0, 0),    
      reverseAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
      icon: SvgIcon(icon: const SvgIconData('images/success.svg'),color: colors.green,size: 15,),
      )..show(context), 
      )  ;
  }

  static void flushbarErrorMessage(String message, BuildContext context){

    AppColors colors = AppColors();

    showFlushbar(
    context: context,
    flushbar: Flushbar(
      duration: const Duration(seconds: 2),
      forwardAnimationCurve: Curves.decelerate,
      borderRadius: BorderRadius.circular(6),
      margin: const EdgeInsets.symmetric( horizontal: 20,vertical: 10),
      padding: const EdgeInsets.all(15),
      message: message, 
      backgroundColor: Colors.red,    
      reverseAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
      icon: const Icon(Icons.error,size: 28,color: Colors.white,),
      )..show(context), 
      )  ;
  }


  static void alertDialog(String messagehead,String messagesub,void Function()? ontap2, BuildContext context){

    AppColors colors = AppColors();

    showCupertinoDialog(
        context: context,
        builder: (context){
        return CupertinoAlertDialog(
        title: Text(messagehead,style: TextStyle(
        fontSize: 15,
        color: colors.textcolor1,
        //fontWeight: FontWeight.w500,
        )),
        content: Text(messagesub,style: TextStyle(
        color: colors.textcolor1,
        //fontWeight: FontWeight.w500,
        )),
        actions:[
        TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('No',style: TextStyle(
        color: colors.dotcolor,
       
        )),),
        
        TextButton(
        onPressed:ontap2,
        child: Text('Yes',style: TextStyle(
        color: colors.dotcolor,
       
        )),),
        ]
        );
        }
        );
    


  }




}