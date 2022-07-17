import 'package:json_annotation/json_annotation.dart';

import 'api_comment.dart';

part 'get_comments_response.g.dart';

@JsonSerializable(createToJson: false)
class GetCommentResponse {
  final List<ApiComment> comments;

  GetCommentResponse(this.comments);

  factory GetCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCommentResponseFromJson(json);
}
