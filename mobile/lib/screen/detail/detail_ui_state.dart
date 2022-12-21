import 'package:mobile/screen/util/images_manager.dart';

/// MainScreen の UI 表示用の状態。
class DetailUiState {
  String user;
  List<String>? imagePaths;
  List<UriFile>? imageFiles;

  DetailUiState({
    required this.user,
    this.imagePaths,
  });

  void sortImageFilesByActionNumbers() {
    imageFiles?.sort((a, b) => a.actionNumber - b.actionNumber);
  }
}
