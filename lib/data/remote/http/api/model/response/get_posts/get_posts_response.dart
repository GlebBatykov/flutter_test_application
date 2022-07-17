import 'package:json_annotation/json_annotation.dart';

import 'api_post.dart';
part 'get_posts_response.g.dart';

@JsonSerializable(createToJson: false)
class GetPostsResponse {
  final List<ApiPost> posts;

  GetPostsResponse(this.posts);

  factory GetPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPostsResponseFromJson(json);
}
