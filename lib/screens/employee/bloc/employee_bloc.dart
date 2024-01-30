import 'package:api_test_task/screens/employee/data/model/employee_model.dart';
import 'package:api_test_task/screens/employee/data/source/employee_api.dart';
import 'package:api_test_task/screens/home/data/model/employee_model.dart';
import 'package:api_test_task/services/api_service/api_exception.dart';
import 'package:api_test_task/utils/debugger/debugger.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeInitial()) {
    on<CreateEmployeeEvent>((event, emit) async {
      emit(ApiCallState());
      try {
        final employeeData = await CreateEmployeeApi.createEmployee(
          model: event.model,
        );
        Debugger(employeeData.status);
        if (employeeData.status == "success") {
          emit(CreateEmployeeSuccessState(dataModel: employeeData));
        } else {
          emit(
            CrudFailedState(message: "Failed to create employee!\nError: ${employeeData.status}"),
          );
          emit(EmployeeInitial());
        }
      } on DioException catch (e) {
        Debugger(e.toString());
        emit(FailedToLoadState(
          message: DioExceptions.fromDioError(e).toString(),
        ));
        emit(EmployeeInitial());
      } catch (e) {
        emit(FailedToLoadState(
          message: e.toString(),
        ));
        emit(EmployeeInitial());
      }
    });
    on<UpdateProfileEvent>((event, emit) async {
      emit(ApiCallState());
      try {
        final profileData = await UpdateProfileApi.updateProfile(
          model: event.model,
          id: event.model.id!,
        );
        Debugger(profileData.message);
        if (profileData.status == "success") {
          emit(UpdateProfileSuccessState(dataModel: profileData));
        } else {
          emit(
            CrudFailedState(message: "Failed to update property!\nError: ${profileData.message}"),
          );
          emit(EmployeeInitial());
        }
      } on DioException catch (e) {
        Debugger(e.toString());
        emit(FailedToLoadState(
          message: DioExceptions.fromDioError(e).toString(),
        ));
        emit(EmployeeInitial());
      } catch (e) {
        emit(FailedToLoadState(
          message: e.toString(),
        ));
        emit(EmployeeInitial());
      }
    });
  }
}
