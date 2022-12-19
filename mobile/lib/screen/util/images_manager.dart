import 'dart:io';

import 'package:file/memory.dart';
import 'package:http/http.dart';
import 'package:mobile/data/remote/constants.dart';
import 'package:mobile/main.dart';

class UriFile {
  String uri;
  File file;

  UriFile(this.uri, this.file);
}

Future<UriFile> convertUriToFile(String userName, String fileName) async {
  File file;

  try {
    var url = fullURL(userName, fileName);
    file = MemoryFileSystem().file(fileName);
    logger.i("Image url: $url");
    var uri = Uri.parse(url);
    file.writeAsBytesSync((await get(uri)).bodyBytes);
  } catch (e) {
    logger.e("error happened when convertUriToFile");
    file = notFoundFile();
  }
  return UriFile(fileName, file);
}

/// 画像が置いてあるパスを返す。
String fullURL(String userName, String fileName) {
  return "$baseURL/images/$userName/$fileName";
}

/// 画像取得失敗時のデフォルト画像。
File notFoundFile() {
  return File("images/not_found.png");
}
