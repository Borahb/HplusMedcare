// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import '../../Utils/colors.dart';
import '../../Utils/validator.dart';
import '../../repositories/user_repository.dart';
import 'ViewModel/signup_view_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final  userRepository = UserRepository();
  AppColors colors = AppColors();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signupviewModel = Provider.of<SignupViewModel>(context);
    
    return LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: Center(
          child: Container(
          width: 70,
          height: 60,
          decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(6)
          ),
          child: Center(
          child: CircularProgressIndicator(
          color: colors.dotcolor,
          ),
          ),
          )
          ),
          child: Scaffold(
          body: SafeArea(
          child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.only(left: 32,right:32),
          child: Form(
          key:formkey,
          child: Column(
          children: [
          const SizedBox(height: 45,),
          Image.asset(
          'images/logo.png',
          width: 72.0,
          height: 72.0,
          fit: BoxFit.cover,
          ),
        
          const SizedBox(height: 30,),
        
          Text("Let's Get Started",style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 19,
          color: colors.textcolor1,                  
          ),
          textAlign: TextAlign.center,),
        
          const SizedBox(height: 15,),
        
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Create a new account",style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: colors.textcolor3
          ),),
          
          ],),
        
          const SizedBox(height: 30,),
        
          TextFormField(
          validator: (value){
            if(value!.isEmpty){
              return "Name cannot be empty";
            }else{
              return null;
            }
          },
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: colors.bordercolor1
          )
          ),
          hintText: "Name",       
          ),
          obscureText: false,
          controller: _nameController,
          ),
    
          const SizedBox(height: 14,),
        
          TextFormField(
          validator: (value){
            if(value!.length < 10){
              return "Enter a valid phone number";
            }else if(value.length > 10){
              return "Enter a 10 digit phone number";
            }
            else{
              return null;
            }
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: colors.bordercolor1
          )
          ),
          hintText: "Phone",       
          ),
          obscureText: false,
          controller: _phoneController,
          ),
        
          const SizedBox(height: 14,),
        
          TextFormField(
          validator: (value){
            if(value!.isEmpty){
              return "Enter your email";
            }else if(!EmailValid.validate(value)){
              return "Enter a valid email";
            }
            else{
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
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
          controller: _emailController,
          ),
        
          const SizedBox(height: 14,),
        
          TextFormField(
            
          validator: (value){
            if(value!.isEmpty){
              return "Enter your password";
            }else if(!Password.valid(value)){
              return "Enter a strong password of 8 characters or longer";
            }else{
              return null;
            }
          },
          keyboardType: TextInputType.visiblePassword,
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
          controller: _passwordController,
          ),
        
          const SizedBox(height: 14,),
        
          TextFormField(
          validator: (value){
            if(value != _passwordController.text){
              return "Password do not match";
            }else{
              return null;
            }
          },
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: colors.bordercolor1
          )
          ),
          hintText: "Password Again",       
          ),
          obscureText: true,
          controller: _passwordController2,
          ),
        
          const SizedBox(height: 20,),
          
          SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          backgroundColor: colors.dotcolor
          ),
          onPressed: (){
            if(formkey.currentState!.validate()){
              //signUp(_emailController.text,_phoneController.text,_nameController.text,_passwordController2.text);
              signupviewModel.signup(_emailController.text,_phoneController.text,_nameController.text,_passwordController2.text, context);
            }
          }, 
          child: Text("Sign Up",style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: colors.white
          ),)),
            )
        
        
        
          ],
          ),
          ),
          ),
        )
        ),
      ),
    );
  }
}