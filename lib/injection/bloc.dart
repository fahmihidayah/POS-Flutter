
import 'package:get_it/get_it.dart';
import 'package:pos/ui/screen/login/bloc/login_bloc.dart';
import 'package:pos/ui/screen/login/form/bloc/login_form_bloc.dart';
import 'package:pos/ui/screen/splash/bloc/splash_bloc.dart';

void blocInitial(GetIt getIt) {
  getIt.registerFactory(() => LoginBloc(userRepository: getIt.get()));
  getIt.registerFactory(() => SplashBloc(commonRepository: getIt.get()));
  getIt.registerFactory(() => LoginFormBloc());
}