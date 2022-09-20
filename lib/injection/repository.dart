import 'package:get_it/get_it.dart';
import 'package:pos/data/repository/common_repository.dart';
import 'package:pos/data/repository/user_repository.dart';

void repositoryInitial(GetIt getIt) {
  getIt.registerLazySingleton(() => CommonRepository(getIt.get()));
  getIt.registerLazySingleton(() => UserRepository(getIt.get()));
}