import 'package:crud_flutter_app/Navigation/nav.dart';
import 'package:crud_flutter_app/screens/create_user.dart';

import 'package:crud_flutter_app/screens/single_user.dart';
import 'package:crud_flutter_app/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Scaffold(body: EmployeeView()),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRouter.homeView: (context) => const MainNav(),
        AppRouter.singleUser: (context) => const SingleUser(),
        AppRouter.createProfile: (context) => const CreateUser()
      },
    );
  }
}
