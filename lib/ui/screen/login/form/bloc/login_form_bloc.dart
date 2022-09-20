import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:meta/meta.dart';
import 'package:pos/util/logger/logger.dart';

part 'login_form_event.dart';

part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(LoginFormInitial()) {
    on(_onEmailChangeEvent);
    on(_onPasswordChangeEvent);
    on(_onEmailValidationEvent);
    on(_onPasswordValidationEvent);
  }

  String email = "";
  String password = "";

  String? _emailValidationMessage = null;
  String? _passwordValidationMessage = null;

  final emailValidator = ValidationBuilder().email().build();
  final passwordValidator = ValidationBuilder().minLength(8).build();

  Future<void> validate() async {
    Future.microtask(() => add(LoginFormValidateEmailEvent(email)) );
    Future.microtask(()=> add(LoginFormValidatePasswordEvent(password)));
  }

  bool isValid() {
    return _emailValidationMessage == null && _passwordValidationMessage == null;
  }

  Future<void> _onEmailChangeEvent(
      LoginFormEmailEvent event, Emitter<LoginFormState> emit) async {
    email = event.text;
  }

  Future<void> _onPasswordChangeEvent(
      LoginFormPasswordEvent event, Emitter<LoginFormState> emit) async {
    password = event.text;
  }

  Future<void> _onEmailValidationEvent(
      LoginFormValidateEmailEvent event, Emitter<LoginFormState> emit) async {
    _emailValidationMessage = emailValidator(email);
    await Future.microtask( () {
      emit(LoginFormStateEmailText(text : email, message: _emailValidationMessage));
    });
  }

  Future<void> _onPasswordValidationEvent (
      LoginFormValidatePasswordEvent event, Emitter<LoginFormState> emit) async {
    _passwordValidationMessage = passwordValidator(password);
    await Future.microtask(() => emit(LoginFormStatePasswordText(text: password, message: _passwordValidationMessage)));
  }
}
