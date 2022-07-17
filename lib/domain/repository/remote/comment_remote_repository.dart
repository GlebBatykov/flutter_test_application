import 'dart:async';

import '../../model/comment.dart';

abstract class CommentRemoteRepository {
  FutureOr<List<Comment>> getCommentsByPostId(int postId);

  FutureOr<Comment> addComment(
      int postId, String name, String email, String text);
}
