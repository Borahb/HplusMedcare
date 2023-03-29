// ignore_for_file: file_names, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hplusmedcare/Models/onboardingpageviewModel.dart';
import 'package:hplusmedcare/Screens/OnboardingScreen/Components/nextbuttton.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:hplusmedcare/repositories/user_repository.dart';


class OnboardingScreen extends StatefulWidget {
  final UserRepository userRepository;
  const OnboardingScreen({ Key ?key, required this.userRepository }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState(userRepository);
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final UserRepository userRepository;
  _OnboardingScreenState(this.userRepository);

  AppColors colors = AppColors();
  int currentIndex = 0;
  PageController _controller = PageController() ;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
        return Scaffold(
        body: SafeArea(
        child: Column(
        children: [
        Expanded(
        child: PageView.builder(
        itemCount: 4,
        controller: _controller,
        onPageChanged: (int index) {
        setState(() {
        currentIndex = index;
        });
        },
        itemBuilder: (context,i){
        return OnboaringContent(colors: colors, i: i,);
        }
        ),
        ),
            
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
        contents.length,
        (index) => buildDot(index, context),
        ),
        ),

        const SizedBox(height: 15,),

        Nextbutton(currentIndex: currentIndex, controller: _controller, colors: colors, userRepository: userRepository,)
        ],
        ),
        )
        );
        }


    Container buildDot(int index, BuildContext context) {
    return Container(
    height: 7,
    width: currentIndex == index ? 25 : 10,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: colors.dotcolor,
    ),
    );
  }

}

class OnboaringContent extends StatelessWidget {
  const OnboaringContent({
    Key ?key,
    required this.colors,
    required this.i,
    
  }) : super(key: key);
  final int i;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:40,right:40,),
      child: Column(
      children: [
      const Spacer(),

      Image.asset(contents[i].image,height: 321,width: 300,),
      
      const Spacer(),
      
      Text(contents[i].title,style: TextStyle(
        fontSize: 28,
        color: colors.textcolor1,
        fontWeight: FontWeight.w800
      ),
      textAlign: TextAlign.center,
      ),
      
      const SizedBox(height: 20,),
      
      Text(contents[i].discription,style: TextStyle(
        fontSize: 18,
        color: colors.textcolor2,
        fontWeight: FontWeight.w400
      ),
      textAlign: TextAlign.center,
      ),
      const Spacer(),
        ],
      ),
      );
}
}


