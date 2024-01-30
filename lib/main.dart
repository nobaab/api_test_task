// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_test_task/services/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'package:api_test_task/screens/home/home_screen.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
        home: const HomeScreenUI());
  }
}
