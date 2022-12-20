import 'package:mobile/data/remote/images_api.dart';
import 'package:mobile/main.dart';
import 'package:mobile/screen/util/images_manager.dart';

import 'detail_ui_state.dart';

class DetailViewModel {
  final ImagesApi _imagesApi;
  DetailUiState uiState = DetailUiState(user: "");

  DetailViewModel(this._imagesApi);

  Future<void> fetchImages() async {
    uiState.imagePaths = (await _imagesApi.fetchImages(uiState.user)).images;

    uiState.imageFiles = await Future.wait(
        (uiState.imagePaths ?? []).map((e) => convertUriToFile(uiState.user, e)));
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
}
