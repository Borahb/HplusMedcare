// ignore_for_file: import_of_legacy_library_into_null_safe
// @dart = 2.9

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hplusmedcare/Bloc/auth_bloc/auth_bloc.dart';
import 'package:hplusmedcare/Bloc/auth_bloc/auth_event.dart';
import 'package:hplusmedcare/Bloc/auth_bloc/auth_state.dart';
import 'package:hplusmedcare/Models/accountmodel.dart';
import 'package:hplusmedcare/Screens/OnboardingScreen/onboardingScreen.dart';
import 'package:hplusmedcare/Screens/Tabbar/tabbar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hplusmedcare/Service/RemoteService/remote_cart_service.dart';
import 'repositories/repositories.dart';


class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //register adapters
  Hive.registerAdapter(AccountModelAdapter());
  await Hive.openBox<AccountModel>('Userinfo');
  await RemoteCartService().getCart();
  AccountModel.accoundata   = await UserRepository().userinfo();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  final bool hasToken = await userRepository.hasToken();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: MyApp(userRepository: userRepository, hastoken: hasToken,),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  final bool hastoken;
  const MyApp({Key  key, @required this.userRepository, @required this.hastoken}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'HplusMedcare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Rubik',
          primarySwatch: Colors.blue,
          ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return const Tabbar();
          }
          if (state is AuthenticationUnauthenticated) {
            return OnboardingScreen(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            return Scaffold(
                body: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                        height: 25.0,
                        width: 25.0,
                              child: CircularProgressIndicator(
                      //valueColor: new AlwaysStoppedAnimation<Color>(StylColors.mainColor),
                  strokeWidth: 4.0,
                  ),
                      )
                    ],
                  ),
                ),
              );
          }
          return Scaffold(
                body: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                        height: 25.0,
                        width: 25.0,
                                          child: CircularProgressIndicator(
          //valueColor: new AlwaysStoppedAnimation<Color>(Style.Colors.mainColor),
          strokeWidth: 4.0,
        ),
                      )
                    ],
                  ),
                ),
              );
        },
      ),
    );
  }
}

