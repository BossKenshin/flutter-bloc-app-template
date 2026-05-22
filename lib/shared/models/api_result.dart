class ApiResult<T> {
  const ApiResult({
    required this.success,
    this.data,
    this.message = '',
    this.statusCode,
  });

  const ApiResult.success(T data, {int? statusCode, String message = ''})
    : this(success: true, data: data, message: message, statusCode: statusCode);

  const ApiResult.failure(String message, {int? statusCode})
    : this(success: false, message: message, statusCode: statusCode);

  final bool success;
  final T? data;
  final String message;
  final int? statusCode;
}
