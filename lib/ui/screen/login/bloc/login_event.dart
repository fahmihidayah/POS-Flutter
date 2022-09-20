part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {

}

class LoginEventSubmit extends LoginEvent {
  final String email;
  final String password;

  LoginEventSubmit({required this.email,required this.password});
}



