part of 'login_bloc.dart';

class LoginState {
  final String? email;
  final String? password;
  final String? errorEmail;
  final String? errorPassword;

  final UserResponse? userResponse;
  final bool? isProgress;
  final bool? isSuccess;

  bool isValid() {
    return errorEmail == null && errorPassword == null;
  }

  LoginState(
      {this.userResponse,
      this.email,
      this.password,
      this.isProgress,
      this.isSuccess,
      this.errorEmail,
      this.errorPassword});

  LoginState copy(
      {String? email,
      String? password,
      UserResponse? userResponse,
      bool? isProgress,
      bool? isSuccess,
      String? errorEmail,
      String? errorPassword}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        userResponse: userResponse ?? this.userResponse,
        isProgress: isProgress,
        isSuccess: isSuccess,
        errorEmail: errorEmail ?? this.errorEmail,
        errorPassword: errorPassword ?? this.errorPassword);
  }
}
