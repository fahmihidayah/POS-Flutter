part of 'login_bloc.dart';

class LoginEvent {
  String text;

  LoginEvent({required this.text});
}

class LoginEventEmailChanged extends LoginEvent {

  LoginEventEmailChanged({required super.text});
}

class LoginEventPasswordChanged extends LoginEvent {
  LoginEventPasswordChanged({required super.text});
}


class LoginEventSubmit extends LoginEvent {

  LoginEventSubmit() : super(text: "");
}



