import 'package:json_annotation/json_annotation.dart';

part 'api_post.g.dart';

@JsonSerializable(createToJson: false)
class ApiPost {
  final int id;

  final int userId;

  final String title;

  final String body;

  ApiPost(this.id, this.userId, this.title, this.body);

  factory ApiPost.fromJson(Map<String, dynamic> json) =>
      _$ApiPostFromJson(json);
}
