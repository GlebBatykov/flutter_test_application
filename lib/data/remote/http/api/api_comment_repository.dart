import 'dart:async';

import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/comment.dart';
import '../../../../domain/repository/remote/comment_remote_repository.dart';
import 'model/request/add/add_comment_request.dart';
import 'model/request/get/get_comments_by_post_id_request.dart';
import 'model/response/get_comments/api_comment.dart';
import 'service/api_comments_service.dart';

class ApiCommentRepository extends CommentRemoteRepository {
  final ApiCommentsService _service = ApiCommentsService();

  @override
  Future<List<Comment>> getCommentsByPostId(int postId) async {
    var request = GetCommentsByPostIdRequest(postId);

    var response = await _service.getCommentsByPostId(request);

    return response.comments
        .map((e) => MapperBox.instanse.map<ApiComment, Comment>(e))
        .toList();
  }

  @override
  Future<Comment> addComment(
      int postId, String name, String email, String text) async {
    var request = AddCommentRequest(postId, name, email, text);

    var response = await _service.addComment(request);

    return MapperBox.instanse.map<ApiComment, Comment>(response.comment);
  }
}
