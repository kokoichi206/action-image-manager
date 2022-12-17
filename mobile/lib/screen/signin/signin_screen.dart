import 'package:flutter/material.dart';
import 'package:mobile/screen/signin/signin_ui_state.dart';
import 'package:mobile/screen/util/widget/custom_input.dart';

/// SignIn 画面。
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInUiState uiState = SignInUiState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomInput(
              labelText: "UserName",
              onChanged: (String input) {
                setState(() {
                  uiState.userName = input;
                });
              },
            ),
            const SizedBox(height: 10),
            CustomInput(
              labelText: "Password",
              onChanged: (String input) {
                setState(() {
                  uiState.password = input;
                });
              },
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 0),
                foregroundColor: buttonTextColor(),
                backgroundColor: buttonBackgroundColor(),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Text("Sign In"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool filledIn() {
    return uiState.userName != "" && uiState.password != "";
  }

  Color buttonTextColor() {
    if (filledIn()) {
      return Colors.white;
    } else {
      return Colors.black.withAlpha(127);
    }
  }

  Color buttonBackgroundColor() {
    if (filledIn()) {
      return Colors.red.shade900;
    } else {
      return Colors.white;
    }
  }
}
