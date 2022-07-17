// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_albums_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAlbumsResponse _$GetAlbumsResponseFromJson(Map<String, dynamic> json) =>
    GetAlbumsResponse(
      (json['albums'] as List<dynamic>)
          .map((e) => ApiAlbum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
