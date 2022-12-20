// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchImagesResponse _$$_FetchImagesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FetchImagesResponse(
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_FetchImagesResponseToJson(
        _$_FetchImagesResponse instance) =>
    <String, dynamic>{
      'images': instance.images,
    };
