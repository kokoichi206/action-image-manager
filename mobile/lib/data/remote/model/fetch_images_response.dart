import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'fetch_images_response.freezed.dart';

part 'fetch_images_response.g.dart';

@freezed
class FetchImagesResponse with _$FetchImagesResponse {
  factory FetchImagesResponse({
    required List<String> images,
  }) = _FetchImagesResponse;

  factory FetchImagesResponse.fromJson(Map<String, Object?> json) =>
      _$FetchImagesResponseFromJson(json);
}
