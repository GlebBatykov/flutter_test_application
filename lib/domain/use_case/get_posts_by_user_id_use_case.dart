import 'package:get_it/get_it.dart';

import '../model/post.dart';
import '../repository/local/post_local_repository.dart';
import '../repository/remote/post_remote_repository.dart';

class GetPostsByUserIdUseCase {
  Future<List<Post>> getPosts(int userId) async {
    var posts = <Post>[];

    var postLocalRepository =
        await GetIt.instance.getAsync<PostLocalRepository>();

    posts.addAll(
        postLocalRepository.get().where((element) => element.userId == userId));

    if (posts.isEmpty) {
      var postRemoteRepository = GetIt.instance<PostRemoteRepository>();

      var remotePosts = await postRemoteRepository.getPostsByUserId(userId);

      posts.addAll(remotePosts);

      postLocalRepository.addAll(remotePosts);

      await postLocalRepository.save();
    }

    return posts;
  }
}
