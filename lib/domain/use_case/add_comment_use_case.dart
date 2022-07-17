import 'package:get_it/get_it.dart';

import '../repository/local/comment_local_repository.dart';
import '../repository/remote/comment_remote_repository.dart';

class AddCommentUseCase {
  Future<void> addComment(
      int postId, String name, String email, String text) async {
    var commentRemoteRepository = GetIt.instance<CommentRemoteRepository>();

    var comment =
        await commentRemoteRepository.addComment(postId, name, email, text);

    var commentLocalRepository =
        await GetIt.instance.getAsync<CommentLocalRepository>();

    commentLocalRepository.add(comment);

    await commentLocalRepository.save();
  }
}
