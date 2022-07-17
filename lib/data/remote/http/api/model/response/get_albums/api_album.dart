import 'package:json_annotation/json_annotation.dart';

part 'api_album.g.dart';

@JsonSerializable(createToJson: false)
class ApiAlbum {
  final int id;

  final int userId;

  final String title;

  ApiAlbum(this.id, this.userId, this.title);

  factory ApiAlbum.fromJson(Map<String, dynamic> json) =>
      _$ApiAlbumFromJson(json);
}
