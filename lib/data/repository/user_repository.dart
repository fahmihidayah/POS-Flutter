import 'package:pos/data/datasource/remote/user_api.dart';
import 'package:pos/data/model/form/login_form.dart';
import 'package:pos/data/model/user.dart';

class UserRepository {
  final UserAPI _userAPI;

  UserRepository(this._userAPI);

  Future<UserResponse> login(
      {required LoginForm loginForm}) async {
    final userResponse = await _userAPI.login(loginForm.email, loginForm.password);
    return userResponse;
  }
}
