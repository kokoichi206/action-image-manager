import 'package:flutter/material.dart';
import 'package:mobile/data/remote/login_api.dart';
import 'package:mobile/screen/signin/signin_viewmodel.dart';
import 'package:mobile/screen/signin/signin_ui_state.dart';
import 'package:mobile/screen/util/widget/custom_input.dart';

/// SignIn 画面。
class SignInScreen extends StatefulWidget {
  /// ログイン状態の変化を伝えるコールバック。
  final Function(bool loggedIn) onLoginChanged;

  const SignInScreen({Key? key, required this.onLoginChanged})
      : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // TODO: 適切に DI を行う。
  SignInViewModel viewModel = SignInViewModel(LoginApi());
  late SignInUiState uiState;

  @override
  void initState() {
    uiState = viewModel.uiState;
    super.initState();
  }

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
                foregroundColor: viewModel.buttonTextColor(),
                backgroundColor: viewModel.buttonBackgroundColor(),
              ),
              onPressed: () async {
                final success = await viewModel.onSignInClicked();
                if (success) {
                  // ログインに成功したことを呼び出し元に伝える。
                  widget.onLoginChanged(success);
                }
              },
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
}
