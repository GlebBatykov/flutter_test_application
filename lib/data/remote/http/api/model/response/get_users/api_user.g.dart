// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiUser _$ApiUserFromJson(Map<String, dynamic> json) => ApiUser(
      json['id'] as int,
      json['username'] as String,
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['website'] as String,
      (json['working'] as List<dynamic>)
          .map((e) => ApiCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['address'] as String,
    );
