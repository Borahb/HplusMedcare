// ignore_for_file: deprecated_member_use, import_of_legacy_library_into_null_safe, unnecessary_null_comparison, avoid_print, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hplusmedcare/Screens/LoginScreen/ViewModel/loginview_model.dart';
import 'package:hplusmedcare/Screens/LoginScreen/loginScreen.dart';
import 'package:hplusmedcare/Screens/SignupScreen/signupscreen.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:hplusmedcare/repositories/user_repository.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import '../../Utils/validator.dart';




class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  const LoginForm({ Key ? key, required this.userRepository }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  AppColors colors = AppColors();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {

    final loginviewModel = Provider.of<LoginViewModel>(context);
    
      return  LoaderOverlay(
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

      Text('Welcome to HplusMedcare',style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 19,
      color: colors.textcolor1,                  
      ),
      textAlign: TextAlign.center,),

      const SizedBox(height: 15,),
        
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text("Sign in to continue",style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: colors.textcolor3
      ),),
      
        ],),

      const SizedBox(height: 32,),

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

      const SizedBox(height: 24,),

      TextFormField(
      validator: (value){
        if(value!.isEmpty){
          return "Enter your Password";
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

      const SizedBox(height: 16,),
        
      Row(
      children: [
      const Spacer(),
      Text('Forgot Password?',style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: colors.textcolor4
      ),
      ),
      ],
      ),

      const SizedBox(height: 20,),
        
              
      SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
      primary: colors.dotcolor
      ),
      onPressed: (){
       if(formkey.currentState!.validate()){
           // signin(_emailController.text,_passwordController.text); 
          //debugPrint(data.toString());
            
          loginviewModel.login(_emailController.text,_passwordController.text,context);

        }
      }, child: Text("Sign In",style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: colors.white
      ),)),
    ),

    const SizedBox(height: 15,),

    orPaddingSection(),

    const SizedBox(height: 10,),

    SignInwithGoogle(colors: colors),     
        
    const SizedBox(height: 30,),
        
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('Don’t have an account?',style: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: colors.textcolor1
    ),
    ),
    const SizedBox(width: 8,),

    GestureDetector(
      onTap: () { 
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
       },
      child: Text('Sign up ',style: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 14,
      color: colors.dotcolor
      ),
      ),
    ),
    ],
    ),
    ],
    ),
    ),
    ),
    ),
    ),
    ),
    );
  }

  Widget orPaddingSection() {
    return Row(
    children: [
      Expanded(
      child: Divider(
      color: Theme.of(context).textTheme.headline4?.color,
      thickness: 1,
      ),
      ),
      Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text('OR',
      style: Theme.of(context).textTheme.headline6?.copyWith(
      color: Theme.of(context).textTheme.headline2?.color)
      ),
      ),
      Expanded(
      child: Divider(
      color: Theme.of(context).textTheme.headline4?.color,
      thickness: 1,
      ),
      ),
      ],
    );
  }
}

