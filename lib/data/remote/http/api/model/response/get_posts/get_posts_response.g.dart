// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostsResponse _$GetPostsResponseFromJson(Map<String, dynamic> json) =>
    GetPostsResponse(
      (json['posts'] as List<dynamic>)
          .map((e) => ApiPost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
