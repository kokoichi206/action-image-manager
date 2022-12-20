import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobile/data/remote/images_api.dart';
import 'package:mobile/main.dart';
import 'package:mobile/screen/util/images_manager.dart';

import 'detail_ui_state.dart';

class DetailViewModel {
  final ImagesApi _imagesApi;
  DetailUiState uiState = DetailUiState(user: "");
  final imagePicker = ImagePicker();

  // Constants
  final maxFileSize = 2000000;

  DetailViewModel(this._imagesApi);

  Future<void> fetchImages() async {
    uiState.imagePaths = (await _imagesApi.fetchImages(uiState.user)).images;

    uiState.imageFiles = await Future.wait((uiState.imagePaths ?? [])
        .map((e) => convertUriToFile(uiState.user, e)));
    return;
  }

  List<List<UriFile>> chunkedImageFiles() {
    List<List<UriFile>> chunks = [];
    int chunkSize = 2;
    if (uiState.imageFiles == null) {
      return chunks;
    }
    var target = uiState.imageFiles!;
    for (var i = 0; i < target.length; i += chunkSize) {
      final isLast = i + chunkSize >= target.length;
      final end = isLast ? target.length : i + chunkSize;
      chunks.add(target.getRange(i, end).toList());
    }
    logger.i("chunks $chunks");
    return chunks;
  }

  Future getImageFromGalley(UriFile uriFile) async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final fileSize = uriFile.file.lengthSync();
      if (fileSize >= maxFileSize) {
        logger.i("fileSize $fileSize is greater than $maxFileSize");
        return;
      }
      uriFile.file = File(pickedFile.path);

      final path = pickedFile.path;
      final lastSeparator = path.lastIndexOf(Platform.pathSeparator);
      final fileName = path.substring(lastSeparator + 1);
      uriFile.fileName = fileName;
    }
  }

  void onUploadButtonClicked() {
    // FIXME: ここ、もう少し上手く書けない？
    if (uiState.imageFiles != null) {
      _imagesApi.multipartPost(uiState.user, uiState.imageFiles!);
    }
  }
}
