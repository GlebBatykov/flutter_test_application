import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../domain/model/post.dart';
import '../../../../domain/use_case/get_posts_by_user_id_use_case.dart';
import '../../../model/user_page_post_preview_data.dart';
import '../../../navigation/post_page_route.dart';

part 'user_posts_page_state.dart';

class UserPostsPageCubit extends Cubit<UserPostsPageState> {
  final int _userId;

  UserPostsPageCubit(int userId)
      : _userId = userId,
        super(UserPostsPageInitial());

  Future<void> initialize() async {
    emit(UserPostsPageLoad());

    var posts = await GetPostsByUserIdUseCase().getPosts(_userId);

    if (posts.isEmpty) {
      emit(UserPostsPageNoPosts());
    } else {
      emit(UserPostsPageShowPosts(_buildData(posts)));
    }
  }

  List<UserPagePostPreviewData> _buildData(List<Post> posts) {
    return posts
        .map((e) =>
            UserPagePostPreviewData(e.title, e.body, _getPostPreviewOnTap(e)))
        .toList();
  }

  void Function() _getPostPreviewOnTap(Post post) => () {
        Poseidon.instance.navigate(PostPageRoute(post));
      };
}
