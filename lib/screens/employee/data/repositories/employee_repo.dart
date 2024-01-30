import 'package:api_test_task/screens/employee/data/model/employee_model.dart';
import 'package:api_test_task/screens/home/data/model/employee_model.dart';
import 'package:api_test_task/utils/debugger/debugger.dart';

import '../source/employee_api.dart';

class CreateEmployeeRepository {
  static Future<EmployeeResponseModel> getData({required EmployeeInfoModel model}) async {
    try {
      final result = await CreateEmployeeApi.createEmployee(
        model: model,
      );
      return result;
    } catch (e) {
      Debugger(e.toString());
      rethrow;
    }
  }
}

class UpdateProfileRepository {
  static Future<EmployeeResponseModel> getData({required EmployeeInfoModel model, required int id}) async {
    try {
      final result = await UpdateProfileApi.updateProfile(model: model, id: model.id!);
      return result;
    } catch (e) {
      Debugger(e.toString());
      rethrow;
    }
  }
}
