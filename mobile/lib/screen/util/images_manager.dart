import 'dart:io';

import 'package:file/memory.dart';
import 'package:http/http.dart';
import 'package:mobile/data/remote/constants.dart';
import 'package:mobile/main.dart';

class UriFile {
  String fileName;
  File file;
  int actionNumber;

  UriFile(this.fileName, this.file, this.actionNumber);
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
  return UriFile(fileName, file, getActionNumberFromFileName(fileName));
}

/// 画像が置いてあるパスを返す。
String fullURL(String userName, String fileName) {
  return "$baseURL/images/$userName/$fileName";
}

/// 画像取得失敗時のデフォルト画像。
File notFoundFile() {
  return File("images/not_found.png");
}

/// ファイル名から、必要なアクション数を取得する。
/// e.g.) 3.png => 3
int getActionNumberFromFileName(String fileName) {
  var separatorIndex = fileName.indexOf(".");
  final actionNumStr = fileName.substring(0, separatorIndex);

  int result;
  try {
    result = int.parse(actionNumStr);
  } catch (e) {
    // FIXME: どうするのが適切か考える。
    result = 0;
  }
  return result;
}

/// ファイル名から拡張子を取得する。
/// e.g.) 3.png => png
String getExtension(String fileName) {
  final lastIndex = fileName.lastIndexOf(".");
  final extension = fileName.substring(lastIndex + 1);
  return extension;
}

String getMimeType(String extension) {
  return "image/$extension";
}

String getFileName(String extension, int actionNumber) {
  return "$actionNumber.$extension";
}
