import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/data/remote/constants.dart';
import 'package:mobile/data/remote/model/fetch_images_response.dart';
import 'package:mobile/data/remote/model/fetch_users_response.dart';

import '../../main.dart';

/// Images に関する API。
class ImagesApi {
  /// path: /users のエンドポイントにアクセスし、ユーザー一覧を取得する。
  Future<FetchUsersResponse> fetchUsers() async {
    final url = Uri.parse("$baseURL/users");
    logger.i("fetchUsers called: endpoint = ${url.path}");

    final response = await http.get(url);

    final body = response.body;
    logger.i("body: $body");
    final json = jsonDecode(body);

    return FetchUsersResponse.fromJson(json);
  }

  /// path: /images のエンドポイントにアクセスし、写真一覧を取得する。
  Future<FetchImagesResponse> fetchImages(String userName) async {
    final url = Uri.parse("$baseURL/images?un=$userName");
    logger.i("fetchImages called: endpoint = ${url.path}");

    final response = await http.get(url);

    final body = response.body;
    logger.i("body: $body");
    final json = jsonDecode(body);

    return FetchImagesResponse.fromJson(json);
  }
}
