// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class InitEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class DataLoadEvent extends HomeEvent {
  final EmployeeListResponseModel model;
  const DataLoadEvent({
    required this.model,
  });

  @override
  List<Object?> get props => [model];
}
