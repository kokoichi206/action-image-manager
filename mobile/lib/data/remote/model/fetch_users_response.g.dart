// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchUsersResponse _$$_FetchUsersResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FetchUsersResponse(
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_FetchUsersResponseToJson(
        _$_FetchUsersResponse instance) =>
    <String, dynamic>{
      'users': instance.users,
    };
