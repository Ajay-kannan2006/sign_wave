import 'package:flutter/material.dart';
import 'package:sign_wave/pages/Login.dart';
// import 'package:page';
import 'package:sign_wave/pages/SignUp.dart';
// import 'package:sign_wave/pages/run.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
    );
  }
}
