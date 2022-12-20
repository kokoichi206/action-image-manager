import 'package:mobile/data/remote/images_api.dart';
import 'package:mobile/main.dart';

import 'list_ui_state.dart';

class ListViewModel {
  final ImagesApi _imagesApi;
  ListUiState uiState = ListUiState();

  ListViewModel(this._imagesApi);

  Future<void> fetchUsers() async {
    uiState.users = (await _imagesApi.fetchUsers()).users;
    logger.i(uiState.users);
  }
}
