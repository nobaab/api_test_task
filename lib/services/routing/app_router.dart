import 'package:api_test_task/models/argument_model.dart';
import 'package:api_test_task/screens/employee/create_employee.dart';
import 'package:api_test_task/screens/employee/edit_employee.dart';
import 'package:api_test_task/screens/employee/employee_details.dart';
import 'package:api_test_task/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case EmployeeDetailsScreenUI.id:
        final args = settings.arguments as EmployeeDetailsArgsModel;
        return MaterialPageRoute(
          builder: (_) => EmployeeDetailsScreenUI(
            model: args.model,
          ),
        );

      case EditEmployeeScreenUI.id:
        final args = settings.arguments as EmployeeDetailsArgsModel;
        return MaterialPageRoute(
          builder: (_) => EditEmployeeScreenUI(
            model: args.model,
          ),
        );
      case CreateEmployeeScreenUI.id:
        // final args = settings.arguments as EmployeeDetailsArgsModel;
        return MaterialPageRoute(
          builder: (_) => CreateEmployeeScreenUI(),
        );

      case HomeScreenUI.id:
        // final args = settings.arguments as EmployeeDetailsArgsModel;
        return MaterialPageRoute(
          builder: (_) => const HomeScreenUI(),
        );
      default:
        return null;
    }
  }
}
