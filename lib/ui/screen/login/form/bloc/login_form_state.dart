part of 'login_form_bloc.dart';

@immutable
abstract class LoginFormState {

  String text = "";
  String? message= "";

  LoginFormState({this.text = "", this.message = ""});
}

class LoginFormInitial extends LoginFormState {}

class LoginFormStateEmailText extends LoginFormState {

  LoginFormStateEmailText({super.text, super.message = ""});
}

class LoginFormStatePasswordText extends LoginFormState {

  LoginFormStatePasswordText({super.text, super.message = ""});
}
