import 'package:json_annotation/json_annotation.dart';

part 'api_image.g.dart';

@JsonSerializable(createToJson: false)
class ApiImage {
  final int id;

  final int albumId;

  final String title;

  final String url;

  ApiImage(this.id, this.albumId, this.title, this.url);

  factory ApiImage.fromJson(Map<String, dynamic> json) =>
      _$ApiImageFromJson(json);
}
