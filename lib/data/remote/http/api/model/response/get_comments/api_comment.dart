import 'package:json_annotation/json_annotation.dart';

part 'api_comment.g.dart';

@JsonSerializable(createToJson: false)
class ApiComment {
  final int id;

  final int postId;

  final String name;

  final String email;

  final String text;

  ApiComment(this.id, this.postId, this.name, this.email, this.text);

  factory ApiComment.fromJson(Map<String, dynamic> json) =>
      _$ApiCommentFromJson(json);
}
