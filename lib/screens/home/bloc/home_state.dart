part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class DataLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class DataLoadedState extends HomeState {
  final EmployeeListResponseModel employeeData;

  const DataLoadedState({required this.employeeData});

  @override
  List<Object?> get props => [employeeData];
}

class FailedToLoadState extends HomeState {
  final String message;

  const FailedToLoadState({required this.message});

  @override
  List<Object?> get props => [message];
}
