import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pos/data/model/user.dart';
import 'package:pos/data/repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc({required UserRepository userRepository}) : _userRepository = userRepository, super(LoginInitial()) {
    on(_onSubmitEvent);
  }

  Future<void> _onSubmitEvent(LoginEventSubmit event, Emitter<LoginState> emit) async {
    final response = await _userRepository.login(username: event.email, password: event.password);
    emit(LoginStateResponse(userResponse: response));
  }
}
