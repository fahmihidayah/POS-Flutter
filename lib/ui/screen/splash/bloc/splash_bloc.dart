import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:pos/data/repository/common_repository.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CommonRepository commonRepository;


  SplashBloc({required this.commonRepository}) : super(SplashInitial()) {
    on(_onInitial);
  }

  Future<void> _onInitial(SplashEventInitial event, Emitter<SplashState> emit) async {
    // final baseResponse = await commonRepository.getCommonData();
    // debugPrint("data splash screen base response ${baseResponse.message} ${baseResponse.code}");
    return Future.delayed(const Duration(seconds: 1), () {
      emit(SplashStateFinish());
    });
  }
}
