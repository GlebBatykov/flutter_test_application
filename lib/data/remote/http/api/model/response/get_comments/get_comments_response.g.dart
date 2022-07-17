// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommentResponse _$GetCommentResponseFromJson(Map<String, dynamic> json) =>
    GetCommentResponse(
      (json['comments'] as List<dynamic>)
          .map((e) => ApiComment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
