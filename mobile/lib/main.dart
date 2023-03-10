import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:mobile/data/local/shared_pref_manager.dart';
import 'package:mobile/screen/main_list/main_list_screen.dart';
import 'package:mobile/screen/signin/signin_screen.dart';

var logger = Logger();

void main() async {
  // Enable Flutter Engine
  WidgetsFlutterBinding.ensureInitialized();

  // 画面の向きを固定！
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

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
          return const MainListScreen();
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
