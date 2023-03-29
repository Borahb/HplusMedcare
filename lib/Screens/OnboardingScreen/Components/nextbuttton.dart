import 'package:flutter/material.dart';
import 'package:hplusmedcare/Models/onboardingpageviewModel.dart';
import 'package:hplusmedcare/Screens/LoginScreen/loginScreen.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:hplusmedcare/repositories/user_repository.dart';


class Nextbutton extends StatefulWidget {
  final UserRepository userRepository;
  const Nextbutton({
    Key? key,
    required this.currentIndex,
    required PageController controller,
    required this.colors,
    required this.userRepository,
  }) : _controller = controller, super(key: key);

  final int currentIndex;
  final PageController _controller;
  final AppColors colors;

  @override
  State<Nextbutton> createState() => _NextbuttonState();
}

class _NextbuttonState extends State<Nextbutton> {
      @override
      Widget build(BuildContext context) {
      return GestureDetector(
      onTap: (){
      if (widget.currentIndex == contents.length - 1) {
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(
      builder: (context) => LoginScreen(userRepository: widget.userRepository,),
      ),
      );
      }
    //print(widget.currentIndex);
      widget._controller.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceIn,
      );
      },
      child: Padding(
      padding: const EdgeInsets.only(bottom:50),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(widget.currentIndex == contents.length - 1 ? "Continue" : "Next",style: TextStyle(
      fontSize: 14,
      color: widget.colors.textcolor1,
      fontWeight: FontWeight.w700
      ),),

      const SizedBox(width: 16,),

      Icon(Icons.arrow_forward_ios,size: 13,color: widget.colors.textcolor1,)
    
      ],
      ),
      ),
      );
      }
}
