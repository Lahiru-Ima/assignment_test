import 'package:assignment_mypos/screens/department_list.dart';
import 'package:assignment_mypos/screens/employee_screen.dart';
import 'package:assignment_mypos/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'screens/employee_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const UserList(),
    );
  }
}
