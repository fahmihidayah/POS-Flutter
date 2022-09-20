import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:pos/data/model/response.dart';

class CommonApi {
  final Dio dio;

  CommonApi(this.dio);

  Future<BaseResponse> getCommon() async {
    final response = await dio.get("api/v1/config");
    debugPrint("${response}");

    final mapResponse = response.data as Map<String, dynamic>;

    return BaseResponse(
        message: mapResponse['message'] as String,
        code: mapResponse['code'] as int,
        error: mapResponse['error'] as bool);
  }
}
