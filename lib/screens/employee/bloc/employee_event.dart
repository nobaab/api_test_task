// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'employee_bloc.dart';

sealed class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfileEvent extends EmployeeEvent {
  final EmployeeInfoModel model;

  final int id;

  const UpdateProfileEvent({
    required this.model,
    required this.id,
  });
}

class CreateEmployeeEvent extends EmployeeEvent {
  final EmployeeInfoModel model;

  const CreateEmployeeEvent({
    required this.model,
  });
}
