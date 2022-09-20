
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pos/data/datasource/remote/common_api.dart';
import 'package:pos/data/datasource/remote/user_api.dart';

void networkInitial(GetIt getIt) {

  getIt.registerLazySingleton(() {
    return UserAPI(getIt.get());
  });

  getIt.registerLazySingleton(() {
    return CommonApi(getIt.get());
  });

  getIt.registerLazySingleton(() {
    final dio = Dio();
    dio.options.baseUrl = "http://192.168.1.6:8001/";
    return dio;
  });
}
