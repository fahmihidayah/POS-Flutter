import 'package:dio/dio.dart';
import 'package:pos/data/model/user.dart';
import 'package:pos/util/logger/logger.dart';

class UserAPI {
  final Dio dio;

  UserAPI(this.dio);

  Future<UserResponse> login(String email, String password) async {
    final response = await dio.post("api/v1/login",
        data: {'username': email, 'password': password}, options: Options(
          followRedirects: false,
            validateStatus: (status) {
              return (status??1000) < 500;
            }
        ));
    final mapData = response.data as Map<String, dynamic>;

    final details = response.statusCode == 200 ? mapData['details'] as Map<String, dynamic> : {};
    logger().d("response login ${response.statusCode}");
    final userResponse = UserResponse(
        message: mapData['message'] as String,
        code: mapData['code'] as int,
        error: mapData['error'] as bool,
        details: response.statusCode == 200 ? User(
            pk: details['pk'] as int,
            email: details['email'] as String,
            firstName: details['first_name'] as String,
            token: details['token'] as String,
            username: details['username'] as String) : null);
    return userResponse;

  }
}
