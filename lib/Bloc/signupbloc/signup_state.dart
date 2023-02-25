// ignore_for_file: camel_case_types

abstract class SignupState {}


class SignupInitial_state extends SignupState{}


class SignupValid_state extends SignupState{}


class SignupError_state extends SignupState{
  String errormsg;
  SignupError_state(this.errormsg);
}


class SignupLoading_state extends SignupState{}