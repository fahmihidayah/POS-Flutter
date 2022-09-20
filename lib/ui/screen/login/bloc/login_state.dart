part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  final UserResponse? userResponse;

  LoginState({required this.userResponse});
}

class LoginInitial extends LoginState {

  LoginInitial({super.userResponse = null});

}

class LoginStateProgress extends LoginState {

  LoginStateProgress({super.userResponse = null});
}

class LoginStateResponse extends LoginState {

  LoginStateResponse({required super.userResponse});

  bool isSuccess() {
    return userResponse?.error == false;
  }
}

