import 'dart:math';

import 'package:dio/dio.dart';
import 'package:pos/util/logger/logger.dart';

class DefaultLoggingInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String requestLog = "";
    requestLog += "request ${options.method} to ${options.baseUrl}${options.path}\n";

    String header = "";
    options.headers.forEach((key, value) { 
      header += "${key}:${value}\n";
    });

    requestLog += "header ${header}\n";

    String queryParameter = "";
    options.queryParameters.forEach((key, value) {
      queryParameter += "${key}:${value}\n";
    });

    requestLog += "query parameter ${queryParameter}\ndata ${options.data}\n";
    logger().d(requestLog);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger().d("response ${response.statusCode} - ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger().e("error response ${err.response?.statusCode} ${err.response?.data} - ${err.message}");
    super.onError(err, handler);
  }
}