// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetImagesResponse _$GetImagesResponseFromJson(Map<String, dynamic> json) =>
    GetImagesResponse(
      (json['images'] as List<dynamic>)
          .map((e) => ApiImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
