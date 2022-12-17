import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mobile/screen/signin/signin_screen.dart';

var logger = Logger();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SignInScreen(),
    );
  }
}
