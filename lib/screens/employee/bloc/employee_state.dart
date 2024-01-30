part of 'employee_bloc.dart';

sealed class EmployeeState extends Equatable {
  const EmployeeState();
}

final class EmployeeInitial extends EmployeeState {
  @override
  List<Object> get props => [];
}

class UpdateProfileSuccessState extends EmployeeState {
  final EmployeeResponseModel dataModel;

  const UpdateProfileSuccessState({required this.dataModel});

  @override
  List<Object?> get props => [dataModel];
}

class CrudFailedState extends EmployeeState {
  final String message;

  const CrudFailedState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ApiCallState extends EmployeeState {
  final String message = "Please Wait...";

  @override
  List<Object?> get props => [message];
}

class FailedToLoadState extends EmployeeState {
  final String message;

  const FailedToLoadState({required this.message});

  @override
  List<Object?> get props => [message];
}

class CreateEmployeeSuccessState extends EmployeeState {
  final EmployeeResponseModel dataModel;

  const CreateEmployeeSuccessState({required this.dataModel});

  @override
  List<Object?> get props => [dataModel];
}
