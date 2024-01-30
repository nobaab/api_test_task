// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_test_task/models/argument_model.dart';
import 'package:api_test_task/screens/employee/edit_employee.dart';
import 'package:flutter/material.dart';

import 'package:api_test_task/screens/home/data/model/employee_model.dart';

class EmployeeDetailsScreenUI extends StatelessWidget {
  const EmployeeDetailsScreenUI({
    Key? key,
    required this.model,
  }) : super(key: key);

  static const id = 'employee_details_screen_ui';
  final EmployeeListInfoModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'ID: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(model.id.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Name: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(model.employeeName.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Salary: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(model.employeeSalary.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Age: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(model.employeeAge.toString()),
                          ],
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/person.jpg'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await Navigator.of(context).pushNamed(
                    EditEmployeeScreenUI.id,
                    arguments: EmployeeDetailsArgsModel(
                      model: model,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit_square,
                  color: Colors.black,
                ),
                label: const Text(
                  "Edit",
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
      ),
    );
  }
}
