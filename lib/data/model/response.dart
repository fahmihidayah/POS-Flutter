class BaseResponse {
  final String message;
  final int code;
  final bool error;

  BaseResponse({required this.message, required this.code, required this.error});
}