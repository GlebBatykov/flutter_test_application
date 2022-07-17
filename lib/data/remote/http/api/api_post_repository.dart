import 'dart:async';

import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/post.dart';
import '../../../../domain/repository/remote/post_remote_repository.dart';
import 'model/request/get/get_posts_by_user_id_request.dart';
import 'model/response/get_posts/api_post.dart';
import 'service/api_posts_service.dart';

class ApiPostRepository extends PostRemoteRepository {
  final ApiPostsService _service = ApiPostsService();

  @override
  Future<List<Post>> getPostsByUserId(int userId) async {
    var request = GetPostsByUserIdRequest(userId);

    var response = await _service.getPostsByUserId(request);

    return response.posts
        .map((e) => MapperBox.instanse.map<ApiPost, Post>(e))
        .toList();
  }
}
