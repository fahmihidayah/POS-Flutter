import 'package:pos/data/datasource/remote/user_api.dart';
import 'package:pos/data/model/user.dart';

class UserRepository {
  final UserAPI _userAPI;

  UserRepository(this._userAPI);

  Future<UserResponse> login(
      {required String username, required String password}) async {
    final userResponse = await _userAPI.login(username, password);
    return userResponse;
  }
}
