import 'package:api_test_task/screens/home/data/model/employee_model.dart';
import 'package:api_test_task/screens/home/data/source/home_api.dart';
import 'package:api_test_task/services/api_service/api_exception.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  static Future<EmployeeListResponseModel> getEmployeeData() async {
    try {
      final response = await HomeApi.getEmployeeListData();
      final users = EmployeeListResponseModel.fromJson(response.data);
      return users;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
