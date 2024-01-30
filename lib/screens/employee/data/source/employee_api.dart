import 'dart:convert';

import 'package:api_test_task/config/api/api_endpoint.dart';
import 'package:api_test_task/screens/employee/data/model/employee_model.dart';
import 'package:api_test_task/screens/home/data/model/employee_model.dart';
import 'package:api_test_task/services/api_service/api_client.dart';
import 'package:api_test_task/utils/debugger/debugger.dart';
import 'package:dio/dio.dart';

class CreateEmployeeApi {
  static final _apiClient = ApiClient();

  static Future<EmployeeResponseModel> createEmployee({required EmployeeInfoModel model}) async {
    try {
      final body = jsonEncode(<String, dynamic>{
        "name": model.name,
        "salary": model.salary,
        "age": model.age,
      });

      final Response response = await _apiClient.post(
        ApiEndPoint.createEmployees,
        body: body,
      );
      final data = EmployeeResponseModel.fromJson(response.data);
      Debugger(data);
      return data;
    } catch (e) {
      Debugger(e.toString());
      rethrow;
    }
  }
}

class UpdateProfileApi {
  static final _apiClient = ApiClient();

  static Future<EmployeeResponseModel> updateProfile({required EmployeeInfoModel model, required int id}) async {
    try {
      final body = jsonEncode(<String, dynamic>{
        "name": model.name,
        "salary": model.salary,
        "age": model.age,
      });

      final Response response = await _apiClient.put(
        "${ApiEndPoint.updateEmployees}/$id",
        body: body,
      );
      final data = EmployeeResponseModel.fromJson(response.data);
      Debugger(data);
      return data;
    } catch (e) {
      Debugger(e.toString());
      rethrow;
    }
  }
}
