import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:pos/data/model/form/login_form.dart';
import 'package:pos/data/model/user.dart';
import 'package:pos/data/repository/user_repository.dart';
import 'package:pos/util/logger/logger.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(LoginState()) {
    on(_onSubmitEvent);
    on(_onPasswordChanged);
    on(_onEmailChanged);
  }

  LoginForm loginForm = LoginForm(email: "", password: "");

  Future<void> _onPasswordChanged(
      LoginEventPasswordChanged event, Emitter<LoginState> emit) async {
    loginForm.password = event.text;
  }

  Future<void> _onEmailChanged(
      LoginEventEmailChanged event, Emitter<LoginState> emit) async {
    loginForm.email = event.text;
  }

  Future<void> _onSubmitEvent(
      LoginEventSubmit event, Emitter<LoginState> emit) async {
    emit(state.copy(
        email: loginForm.email,
        password: loginForm.password,
        isProgress: true));
    try {
      final response = await _userRepository.login(loginForm: loginForm);
      emit(state.copy(
          email: loginForm.email,
          password: loginForm.password,
          userResponse: response));
    } on DioError catch (ex) {
      emit(state.copy(
          isSuccess: false,
          email: loginForm.email,
          password: loginForm.password,
          userResponse: UserResponse(
              message: ex.message, code: 404, error: true, details: null)));
    }
  }
}
