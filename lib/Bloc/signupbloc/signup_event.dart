// ignore_for_file: camel_case_types

abstract class SignUpEvents {}



class Signuptextchange_event extends SignUpEvents {
  String name;
  String email;
  String pass;
  Signuptextchange_event(this.email,this.name,this.pass);
}



class Signupsubmitted_event extends SignUpEvents{
  String name;
  String email;
  String pass;
  Signupsubmitted_event(this.email,this.name,this.pass);
}