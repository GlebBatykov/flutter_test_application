// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersResponse _$GetUsersResponseFromJson(Map<String, dynamic> json) =>
    GetUsersResponse(
      (json['users'] as List<dynamic>)
          .map((e) => ApiUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
