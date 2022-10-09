import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pos/data/datasource/remote/common_api.dart';
import 'package:pos/data/datasource/remote/user_api.dart';
import 'package:pos/injection/bloc.dart';
import 'package:pos/injection/network.dart';
import 'package:pos/injection/repository.dart';
import 'package:pos/util/network/interceptor.dart';

final getIt = GetIt.instance;

void mainInitial() {
  getIt.registerLazySingleton(() {
    return Logger();
  });

  getIt.registerLazySingleton(() {
    return UserAPI(getIt.get());
  });

  getIt.registerLazySingleton(() {
    return CommonApi(getIt.get());
  });

  getIt.registerLazySingleton(() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000,
        baseUrl: "http://192.168.1.6:8001/"
        // baseUrl: "http://192.168.100.147:8001/"
      )
    );
    dio.interceptors.add(DefaultLoggingInterceptor());
    return dio;
  });

  repositoryInitial(getIt);

  blocInitial(getIt);
}