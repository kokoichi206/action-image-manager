// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_users_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchUsersResponse _$FetchUsersResponseFromJson(Map<String, dynamic> json) {
  return _FetchUsersResponse.fromJson(json);
}

/// @nodoc
mixin _$FetchUsersResponse {
  List<String> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchUsersResponseCopyWith<FetchUsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchUsersResponseCopyWith<$Res> {
  factory $FetchUsersResponseCopyWith(
          FetchUsersResponse value, $Res Function(FetchUsersResponse) then) =
      _$FetchUsersResponseCopyWithImpl<$Res, FetchUsersResponse>;
  @useResult
  $Res call({List<String> users});
}

/// @nodoc
class _$FetchUsersResponseCopyWithImpl<$Res, $Val extends FetchUsersResponse>
    implements $FetchUsersResponseCopyWith<$Res> {
  _$FetchUsersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchUsersResponseCopyWith<$Res>
    implements $FetchUsersResponseCopyWith<$Res> {
  factory _$$_FetchUsersResponseCopyWith(_$_FetchUsersResponse value,
          $Res Function(_$_FetchUsersResponse) then) =
      __$$_FetchUsersResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> users});
}

/// @nodoc
class __$$_FetchUsersResponseCopyWithImpl<$Res>
    extends _$FetchUsersResponseCopyWithImpl<$Res, _$_FetchUsersResponse>
    implements _$$_FetchUsersResponseCopyWith<$Res> {
  __$$_FetchUsersResponseCopyWithImpl(
      _$_FetchUsersResponse _value, $Res Function(_$_FetchUsersResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$_FetchUsersResponse(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FetchUsersResponse
    with DiagnosticableTreeMixin
    implements _FetchUsersResponse {
  _$_FetchUsersResponse({required final List<String> users}) : _users = users;

  factory _$_FetchUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FetchUsersResponseFromJson(json);

  final List<String> _users;
  @override
  List<String> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FetchUsersResponse(users: $users)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FetchUsersResponse'))
      ..add(DiagnosticsProperty('users', users));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchUsersResponse &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchUsersResponseCopyWith<_$_FetchUsersResponse> get copyWith =>
      __$$_FetchUsersResponseCopyWithImpl<_$_FetchUsersResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchUsersResponseToJson(
      this,
    );
  }
}

abstract class _FetchUsersResponse implements FetchUsersResponse {
  factory _FetchUsersResponse({required final List<String> users}) =
      _$_FetchUsersResponse;

  factory _FetchUsersResponse.fromJson(Map<String, dynamic> json) =
      _$_FetchUsersResponse.fromJson;

  @override
  List<String> get users;
  @override
  @JsonKey(ignore: true)
  _$$_FetchUsersResponseCopyWith<_$_FetchUsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
