// ignore_for_file: deprecated_member_use, import_of_legacy_library_into_null_safe, unnecessary_null_comparison
import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hplusmedcare/Bloc/login_bloc/login_bloc.dart';
import 'package:hplusmedcare/Bloc/login_bloc/login_state.dart';
import 'package:hplusmedcare/Screens/LoginScreen/loginScreen.dart';
import 'package:hplusmedcare/Utils/app_url.dart';
import 'package:hplusmedcare/Utils/colors.dart';
import 'package:hplusmedcare/repositories/repositories.dart';
import 'package:http/http.dart' as http;



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
  late bool loading;

  // void signin(String email, String pass)async{
  //   final String token = await widget.userRepository.login(email,pass);
  //   if (token != null){
  //     await widget.userRepository.persistToken(token);
  //   }
  //   print(token);
  //   setState(() {
  //     loading = true;
  //   });
  //   } 

  @override
  void initState() {
    loading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login failed."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state){
          return Scaffold(
            body: SafeArea(
                  child: SingleChildScrollView(
            child: Padding(
            padding: const EdgeInsets.only(left: 32,right:32),
            child: Form(
              child: Column(
                children: [
                  const SizedBox(height: 62,),
                  Text('Sign in',style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: colors.textcolor1,                  
                  ),
                  textAlign: TextAlign.center,),
            
                  const SizedBox(height: 64,),
            
                  SignInwithGoogle(colors: colors),
            
                  const SizedBox(height: 40,),
            
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Divider(thickness: 2,),
                        Text("Sign in with Email",style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: colors.textcolor3
                          ),),
                        const Divider(),
            
                      ],)
                  ),
            
                  const SizedBox(height: 32,),
            
                  Emailtextfield(colors: colors, emailcontroller: _emailController,),
            
                  const SizedBox(height: 24,),
            
                  Passwordtextfield(colors: colors, passwordcontroller: _passwordController,),
            
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
            
                  const SizedBox(height: 36,),
            
                  SizedBox(
                    child:  state is LoginLoading ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                children: const [
                                  // ignore: prefer_const_constructors
                                  SizedBox(
                                    height:25,
                                    width: 25,
                                    child: CupertinoActivityIndicator(),
                                  )
                                ],
                              ),
                            )
                          ],
                    ): SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: colors.dotcolor
                        ),
                        onPressed: ()async{
                          
                          BlocProvider.of<LoginBloc>(context)
                            .add(
                            LoginButtonPressed(email: _emailController.text, 
                            password: _passwordController.text,),);
                          
                        }, child: Text("Sign In",style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: colors.textcolor1
                        ),)),
                    ),
                  ),
            
                  const SizedBox(height: 40,),
            
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
                      Text('Sign up ',style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: colors.dotcolor
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
          );
        }
        ),
      );
  }
}

