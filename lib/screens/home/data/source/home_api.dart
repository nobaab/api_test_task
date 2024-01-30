import 'package:api_test_task/config/api/api_endpoint.dart';
import 'package:api_test_task/services/api_service/api_client.dart';
import 'package:api_test_task/services/api_service/api_exception.dart';
import 'package:dio/dio.dart';

class HomeApi {
  static final _apiClient = ApiClient();
  static Future<Response> getEmployeeListData() async {
    try {
      final Response response = await _apiClient.get(ApiEndPoint.employees);

      return response;
    } on DioException catch (e) {
      DioExceptions.fromDioError(e).toString();
      rethrow;
    }
  }
}
