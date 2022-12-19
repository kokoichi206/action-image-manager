import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'fetch_users_response.freezed.dart';
part 'fetch_users_response.g.dart';

@freezed
class FetchUsersResponse with _$FetchUsersResponse {
  factory FetchUsersResponse({
    required List<String> users,
  }) = _FetchUsersResponse;

  factory FetchUsersResponse.fromJson(Map<String, Object?> json) =>
      _$FetchUsersResponseFromJson(json);
}
