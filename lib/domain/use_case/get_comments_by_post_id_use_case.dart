import 'package:get_it/get_it.dart';

import '../model/comment.dart';
import '../repository/local/comment_local_repository.dart';
import '../repository/remote/comment_remote_repository.dart';

class GetCommentsByPostIdUseCase {
  Future<List<Comment>> getComments(int postId) async {
    var comments = <Comment>[];

    var commentLocalRepository =
        await GetIt.instance.getAsync<CommentLocalRepository>();

    comments.addAll(commentLocalRepository
        .get()
        .where((element) => element.postId == postId));

    if (comments.isEmpty) {
      var commentRemoteRepository = GetIt.instance<CommentRemoteRepository>();

      var remoteComments =
          await commentRemoteRepository.getCommentsByPostId(postId);

      comments.addAll(remoteComments);

      commentLocalRepository.addAll(remoteComments);

      await commentLocalRepository.save();
    }

    return comments;
  }
}
