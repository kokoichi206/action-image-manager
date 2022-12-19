// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_images_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchImagesResponse _$FetchImagesResponseFromJson(Map<String, dynamic> json) {
  return _FetchImagesResponse.fromJson(json);
}

/// @nodoc
mixin _$FetchImagesResponse {
  List<String> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchImagesResponseCopyWith<FetchImagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchImagesResponseCopyWith<$Res> {
  factory $FetchImagesResponseCopyWith(
          FetchImagesResponse value, $Res Function(FetchImagesResponse) then) =
      _$FetchImagesResponseCopyWithImpl<$Res, FetchImagesResponse>;
  @useResult
  $Res call({List<String> images});
}

/// @nodoc
class _$FetchImagesResponseCopyWithImpl<$Res, $Val extends FetchImagesResponse>
    implements $FetchImagesResponseCopyWith<$Res> {
  _$FetchImagesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchImagesResponseCopyWith<$Res>
    implements $FetchImagesResponseCopyWith<$Res> {
  factory _$$_FetchImagesResponseCopyWith(_$_FetchImagesResponse value,
          $Res Function(_$_FetchImagesResponse) then) =
      __$$_FetchImagesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> images});
}

/// @nodoc
class __$$_FetchImagesResponseCopyWithImpl<$Res>
    extends _$FetchImagesResponseCopyWithImpl<$Res, _$_FetchImagesResponse>
    implements _$$_FetchImagesResponseCopyWith<$Res> {
  __$$_FetchImagesResponseCopyWithImpl(_$_FetchImagesResponse _value,
      $Res Function(_$_FetchImagesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$_FetchImagesResponse(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FetchImagesResponse
    with DiagnosticableTreeMixin
    implements _FetchImagesResponse {
  _$_FetchImagesResponse({required final List<String> images})
      : _images = images;

  factory _$_FetchImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FetchImagesResponseFromJson(json);

  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FetchImagesResponse(images: $images)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FetchImagesResponse'))
      ..add(DiagnosticsProperty('images', images));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchImagesResponse &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchImagesResponseCopyWith<_$_FetchImagesResponse> get copyWith =>
      __$$_FetchImagesResponseCopyWithImpl<_$_FetchImagesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchImagesResponseToJson(
      this,
    );
  }
}

abstract class _FetchImagesResponse implements FetchImagesResponse {
  factory _FetchImagesResponse({required final List<String> images}) =
      _$_FetchImagesResponse;

  factory _FetchImagesResponse.fromJson(Map<String, dynamic> json) =
      _$_FetchImagesResponse.fromJson;

  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$_FetchImagesResponseCopyWith<_$_FetchImagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
