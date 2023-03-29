// ignore_for_file: file_names, import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Screens/LoginScreen/loginform.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:hplusmedcare/repositories/user_repository.dart';



class LoginScreen extends StatelessWidget {
   final UserRepository userRepository;
  const LoginScreen({ Key ?key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LoginForm(userRepository: userRepository,);
      
    
  }
}


class SignInwithGoogle extends StatelessWidget {
  const SignInwithGoogle({
    Key ?key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration:BoxDecoration(
        border: Border.all(color: colors.darkmode),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Image.asset("images/Google.png", width: 25,height: 24,),
          
          const SizedBox(width: 10,),

          Text("Sign in with Google",style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 17,
            color: colors.textcolor3
            ),)
        ],
      ),
    );
  }
}

class Passwordtextfield extends StatelessWidget {
  const Passwordtextfield({
    Key? key,
    required this.colors,
    required this.passwordcontroller
  }) : super(key: key);

  final AppColors colors;
  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: colors.bordercolor1
          )
        ),
        hintText: "Password",
      ),
      
      obscureText: true,
      controller: passwordcontroller,
    );
  }
}

class Emailtextfield extends StatelessWidget {
  const Emailtextfield({
    Key ? key,
    required this.colors,
    required this.emailcontroller
  }) : super(key: key);

  final AppColors colors;
  final TextEditingController emailcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: BorderSide(
    color: colors.bordercolor1
    )
    ),
    hintText: "Email",       
    ),
    obscureText: false,
    controller: emailcontroller,
    );
  }
}