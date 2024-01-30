import 'package:api_test_task/screens/home/data/model/employee_model.dart';
import 'package:api_test_task/screens/home/data/repositories/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<DataLoadEvent>((event, emit) async {
      emit(DataLoadingState());
      try {
        final employeeData = await HomeRepository.getEmployeeData();
        emit(DataLoadedState(employeeData: employeeData));
      } catch (e) {
        emit(FailedToLoadState(message: e.toString()));
      }
    });
  }
}
