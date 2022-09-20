import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pos/data/datasource/remote/user_api.dart';
import 'package:pos/data/repository/user_repository.dart';
import 'package:pos/ui/screen/login/bloc/login_bloc.dart';
//
// final getIt = GetIt.instance;
//
// void init() {
//
//   getIt.registerFactory(() => LoginBloc(userRepository: getIt.get()));
//
//   getIt.registerLazySingleton(() => UserRepository(getIt.get()));
//
//   getIt.registerLazySingleton(() {
//     return UserAPI(getIt.get());
//   });
//
//   getIt.registerLazySingleton(() {
//     final dio = Dio();
//     dio.options.baseUrl = "http://192.168.1.6:8001/";
//     return dio;
//   });
// }
