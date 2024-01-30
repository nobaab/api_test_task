import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to the API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with the API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with the API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with the API server";
        break;
      case DioExceptionType.connectionError:
        if (dioError.message.contains("SocketException")) {
          message = 'No internet connection';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return "Bad Request";
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'] ?? 'Resource not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      case 429:
        return 'Too Many Requests';
      default:
        return 'Oops! Something went wrong';
    }
  }

  static Interceptor get dioInterceptor => InterceptorsWrapper(
        onError: (error, ErrorInterceptorHandler handler) {
          throw DioExceptions.fromDioError(error);
        },
      );

  @override
  String toString() => message;
}
