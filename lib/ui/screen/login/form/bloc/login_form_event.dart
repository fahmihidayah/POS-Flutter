part of 'login_form_bloc.dart';

@immutable
abstract class LoginFormEvent {
  final String text;

  LoginFormEvent(this.text);
}

class LoginFormEmailEvent extends LoginFormEvent {
  LoginFormEmailEvent(super.text);

}

class LoginFormPasswordEvent extends LoginFormEvent {

  LoginFormPasswordEvent(super.text);
}

class LoginFormValidateEmailEvent extends LoginFormEvent {

  LoginFormValidateEmailEvent(super.text);

}

class LoginFormValidatePasswordEvent extends LoginFormEvent {

  LoginFormValidatePasswordEvent(super.text);
}

