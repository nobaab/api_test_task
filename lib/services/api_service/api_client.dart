import 'package:api_test_task/services/api_service/api_service.dart';
import 'package:dio/dio.dart';
import '../../utils/debugger/debugger.dart';
import '../helper_service/dio_helper.dart';

class ApiClient implements ApiService {
  final _dioHelper = DioHelper();

  late Dio _dio;

  static final ApiClient _ac = ApiClient._init();

  factory ApiClient() {
    return _ac;
  }
  ApiClient._init() {
    _dio = _dioHelper.dio;
  }

  @override
  Future<Response> get(
    String url, {
    String? token,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Debugger("${_dio.options.baseUrl}$url");
      final headers = {
        'Authorization': 'Bearer $token',
      };
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      Debugger("response_code: ${response.statusCode}");
      Debugger("response_data: ${response.data}");

      return response;
    } catch (e) {
      Debugger("catch>>ApiClient>>get(): ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<Response> post(
    String url, {
    dynamic body,
    String? token,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Debugger("${_dio.options.baseUrl}$url");
      Debugger("$token");
      Debugger("$body");
      final headers = {
        'Authorization': 'Bearer $token',
      };

      final Response response = await _dio.post(
        url,
        options: Options(headers: headers),
        data: body,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      Debugger("response_code: ${response.statusCode}");
      Debugger("response_data: ${response.data}");

      return response;
    } catch (e) {
      Debugger("catch>>ApiClient>>post(): ${e.toString()}");

      rethrow;
    }
  }

  @override
  @override
  Future<Response> put(
    String url, {
    dynamic body,
    String? token,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Debugger("${_dio.options.baseUrl}$url");
      Debugger("$token");
      Debugger("$body");
      final headers = {
        'Authorization': 'Bearer $token',
      };

      final Response response = await _dio.put(
        url,
        options: Options(headers: headers),
        data: body,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      Debugger("response_code: ${response.statusCode}");
      Debugger("response_data: ${response.data}");

      return response;
    } catch (e) {
      Debugger("catch>>ApiClient>>put(): ${e.toString()}");
      rethrow;
    }
  }
}
