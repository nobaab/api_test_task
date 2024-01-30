import 'package:api_test_task/screens/employee/bloc/employee_bloc.dart';
import 'package:api_test_task/screens/employee/data/model/employee_model.dart';
import 'package:api_test_task/screens/home/home_screen.dart';
import 'package:api_test_task/shared/custom_textf_filed.dart';
import 'package:api_test_task/shared/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateEmployeeScreenUI extends StatelessWidget {
  CreateEmployeeScreenUI({super.key});

  static const id = "create_employee";
  final List<TextEditingController> _textInputControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Employee'),
        ),
        body: BlocConsumer<EmployeeBloc, EmployeeState>(
          listener: (context, state) {
            if (state is CreateEmployeeSuccessState) {
              final message = state.dataModel.message;
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  BexcaSnackBar.successMessage(
                    message: message ?? 'Profile Created Successfully.',
                  ),
                );
              Navigator.pushNamed(context, HomeScreenUI.id);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreenUI()));
            } else if (state is CrudFailedState) {
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  BexcaSnackBar.errorMessage(
                    message: state.message,
                  ),
                );
            } else if (state is FailedToLoadState) {
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  BexcaSnackBar.errorMessage(
                    message: state.message,
                  ),
                );
            } else if (state is ApiCallState) {
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  BexcaSnackBar.waitingMessage(
                    message: state.message,
                  ),
                );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 10,
                  ),
                  BexcaTextField(
                    hintText: "Name",
                    controller: _textInputControllers[0],
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Salary", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 10,
                  ),
                  BexcaTextField(
                    hintText: "Salary",
                    controller: _textInputControllers[1],
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Age", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 10,
                  ),
                  BexcaTextField(
                    hintText: "Age",
                    controller: _textInputControllers[2],
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        EmployeeInfoModel model = EmployeeInfoModel(
                          name: _textInputControllers[0].text,
                          salary: _textInputControllers[1].text,
                          age: _textInputControllers[2].text,
                        );
                        BlocProvider.of<EmployeeBloc>(context).add(CreateEmployeeEvent(model: model));
                      },
                      icon: const Icon(
                        Icons.edit_square,
                        color: Colors.black,
                      ),
                      label: const Text(
                        "Create Employee",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: const Color(0xFF196E55),
                          ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
