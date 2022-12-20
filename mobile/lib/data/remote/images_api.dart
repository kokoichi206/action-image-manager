import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/data/remote/constants.dart';
import 'package:mobile/data/remote/model/fetch_images_response.dart';
import 'package:mobile/data/remote/model/fetch_users_response.dart';
import 'package:http_parser/http_parser.dart';

import '../../main.dart';
import '../../screen/util/images_manager.dart';

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

  void multipartPost(String userName, List<UriFile> uriFiles) async {
    logger.i("multipart called: $uriFiles");
    var url = Uri.parse("$baseURL/images");
    var request = http.MultipartRequest("POST", url);

    // 最大5枚の写真ファイルを送信する。
    const maxFilesCounts = 5;

    int counter = 1;
    for (var uriFile in uriFiles) {
      if (counter > maxFilesCounts) {
        break;
      }
      final extension = getExtension(uriFile.fileName);
      final mimeType = getMimeType(extension);
      final fileName = getFileName(extension, uriFile.actionNumber);
      logger.i(
          "(extension, mimeType, fileName) = ($extension, $mimeType, $fileName)");

      request.files.add(http.MultipartFile.fromBytes(
        "field$counter",
        uriFile.file.readAsBytesSync(),
        filename: fileName,
        contentType: MediaType.parse(mimeType),
      ));

      counter += 1;
    }

    var fields = {"person": userName};
    request.fields.addAll(fields);

    request.send().then((response) => logger.i(response));
  }
}
