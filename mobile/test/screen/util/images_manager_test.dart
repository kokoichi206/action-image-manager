import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/screen/util/images_manager.dart';

void main() {
  // Arrange
  var fileName = "3.png";

  // Act
  var result = getActionNumberFromFileName(fileName);

  // Assert
  expect(result, 3);
}
