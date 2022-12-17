import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mobile/data/local/shared_pref_manager.dart';
import 'package:mobile/screen/main/main_screen.dart';
import 'package:mobile/screen/signin/signin_screen.dart';

var logger = Logger();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isLoggedIn = false;

  @override
  void initState() {
    Future(() async {
      final success = await SharedPrefManager().readLoggedIn();
      setState(() {
        isLoggedIn = success;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: (() {
        /// ログイン状態によってメイン画面とログイン画面のどちらを表示するかを切り替える。
        if (isLoggedIn) {
          return const MainScreen();
        } else {
          return SignInScreen(
            onLoginChanged: (loggedInSuccess) {
              setState(() {
                isLoggedIn = loggedInSuccess;
              });
            },
          );
        }
      })(),
    );
  }
}
