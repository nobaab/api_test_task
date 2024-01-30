import 'package:api_test_task/models/argument_model.dart';
import 'package:api_test_task/screens/employee/create_employee.dart';
import 'package:api_test_task/screens/employee/employee_details.dart';
import 'package:api_test_task/screens/home/bloc/home_bloc.dart';
import 'package:api_test_task/screens/home/data/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenUI extends StatelessWidget {
  const HomeScreenUI({Key? key}) : super(key: key);

  static const id = "home_screen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(DataLoadEvent(model: EmployeeListResponseModel())),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              CreateEmployeeScreenUI.id,
            );
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Employee Data'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is DataLoadedState) {
                return RefreshIndicator(
                    onRefresh: () async {
                      context.read<HomeBloc>().add(
                            DataLoadEvent(
                              model: EmployeeListResponseModel(),
                            ),
                          );
                    },
                    child: _buildLoadedState(state.employeeData.data));
              } else if (state is DataLoadingState) {
                return _buildLoadingState();
              } else if (state is FailedToLoadState) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<HomeBloc>().add(
                          DataLoadEvent(
                            model: EmployeeListResponseModel(),
                          ),
                        );
                  },
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              } else {
                return const Center(
                  child: Text('No Data'),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedState(List<EmployeeListInfoModel>? employeeData) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(),
            itemCount: employeeData?.length ?? 0,
            itemBuilder: (context, index) {
              final employee = employeeData![index];
              return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      EmployeeDetailsScreenUI.id,
                      arguments: EmployeeDetailsArgsModel(model: employee),
                    );
                  },
                  child: _buildEmployeeCard(employee));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: _buildShimmerCard(),
        );
      },
    );
  }

  Widget _buildEmployeeCard(EmployeeListInfoModel employee) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/person.jpg'),
        ),
        title: Text(employee.employeeName ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Age: ${employee.employeeAge ?? ''}'),
            Text('Salary: \$${employee.employeeSalary?.toStringAsFixed(2) ?? ''}'),
          ],
        ),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }

  Widget _buildShimmerCard() {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
        ),
        title: const Text(''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 16,
              color: Colors.white,
            ),
            const SizedBox(height: 4),
            Container(
              width: 80,
              height: 16,
              color: Colors.white,
            ),
          ],
        ),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
