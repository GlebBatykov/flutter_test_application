import 'dart:async';

import '../../model/post.dart';

abstract class PostRemoteRepository {
  FutureOr<List<Post>> getPostsByUserId(int userId);
}
