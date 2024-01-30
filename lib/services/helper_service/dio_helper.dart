import 'package:api_test_task/config/api/api_endpoint.dart';
import 'package:dio/dio.dart';

class DioHelper {
  final dio = Dio();

  static final DioHelper _dc = DioHelper._init();

  factory DioHelper() {
    return _dc;
  }

  DioHelper._init() {
    dio
      ..options.baseUrl = ApiEndPoint.baseUrl
      ..options.connectTimeout = const Duration(minutes: ApiEndPoint.connectionTimeout)
      ..options.receiveTimeout = const Duration(minutes: ApiEndPoint.receiveTimeout)
      ..options.responseType = ResponseType.json;
  }
}
