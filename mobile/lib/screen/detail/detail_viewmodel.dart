import 'package:mobile/data/remote/images_api.dart';
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
}
