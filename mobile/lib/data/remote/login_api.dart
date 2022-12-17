import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile/data/remote/constants.dart';

import '../../main.dart';

/// Login に関する API。
class LoginApi {
  /// path: /github のエンドポイントにアクセスし、認証情報が正しいか確認する。
  Future<http.Response> checkAuth(String userName, String password) async {
    final url = Uri.parse("$baseURL/github");
    logger.i("checkAuth called: endpoint = ${url.path}");

    // ヘッダーに付与する Base64 の認証情報を作成。
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String auth = stringToBase64.encode("$userName:$password");

    return await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: "Basic $auth",
      },
    );
  }
}
