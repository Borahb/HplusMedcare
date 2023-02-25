

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lafyuu/Screens/SignUpScreen/signup_event.dart';
// import 'package:lafyuu/Screens/SignUpScreen/signup_state.dart';
// import 'package:lafyuu/Utils/validator.dart';

// class Signup_bloc extends Bloc<SignUpEvents, SignupState>{

//   Signup_bloc() : super(SignupInitial_state()) {

//       on<Signuptextchange_event>((event, emit) {
//         if(event.name == ''){
//           emit(SignupError_state('Please enter a name !'));
//         }
//         else if (EmailValid.validate(event.email) == false){
//           emit(SignupError_state('Please enter a valid email !'));
//         }
//         else if (Password.valid(event.pass) == false){
//           emit(SignupError_state('Please enter a strong password'));
//         }
//         else{
//           emit(SignupValid_state());
//         }
//       });

//       on<Signupsubmitted_event>((event, emit){
//         emit(SignupLoading_state());
//       });
//   }


// }