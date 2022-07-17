import 'package:json_annotation/json_annotation.dart';

import 'get_comments/api_comment.dart';

part 'add_comment_response.g.dart';

@JsonSerializable(createToJson: false)
class AddCommentResponse {
  final ApiComment comment;

  AddCommentResponse(this.comment);

  factory AddCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCommentResponseFromJson(json);
}
