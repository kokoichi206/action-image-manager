import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/screen/signin/signin_ui_state.dart';

import '../../data/remote/login_api.dart';

class SignInViewModel {
  final LoginApi _loginApi;
  SignInUiState uiState = SignInUiState();

  SignInViewModel(this._loginApi);

  /// Sign In ボタンが押された時に呼ばれる。
  Future<bool> onSignInClicked() async {
    // バリデーション
    if (uiState.userName.isEmpty || uiState.password.isEmpty) {
      return false;
    }
    logger.i("_checkAuth with userName: ${uiState.userName}");
    return _checkAuth(uiState.userName, uiState.password);
  }

  /// 実際に判定を行う処理。
  ///
  /// [userName] 入力されたユーザー名。
  /// [password] 入力されたパスワード。
  Future<bool> _checkAuth(String userName, String password) async {
    var response = await _loginApi.checkAuth(userName, password);
    print("response.statusCode: ${response.statusCode}");
    return response.statusCode == HttpStatus.ok;
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
