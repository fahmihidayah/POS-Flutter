import 'package:json_annotation/json_annotation.dart';
import 'package:pos/data/model/response.dart';

@JsonSerializable()
class User {
  final int pk;
  final String username;
  final String email;
  final String firstName;
  final String token;

  User({
    required this.pk,
    required this.username,
    required this.email,
    required this.firstName,
    required this.token
  });
}

class UserResponse extends BaseResponse {
  final User? details;

  UserResponse(
      {required super.message, required super.code, required super.error, required this.details});
}