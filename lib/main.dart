import 'package:flutter/material.dart';
import 'package:students_attendance_system_mobile/screens/login/login_screen.dart';
import 'package:students_attendance_system_mobile/shared/styles/themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appThem,
      home: const LoginScreen(),
    );
  }
}
