import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../../domain/model/post.dart';
import '../../../../../domain/use_case/get_posts_by_user_id_use_case.dart';
import '../../../../model/user_page_post_preview_data.dart';
import '../../../../navigation/post_page_route.dart';
import '../../../../navigation/user_posts_page_route.dart';

part 'user_page_posts_state.dart';

class UserPagePostsCubit extends Cubit<UserPagePostsState> {
  final int _userId;

  UserPagePostsCubit(int userId)
      : _userId = userId,
        super(UserPagePostsInitial());

  Future<void> initialize() async {
    emit(UserPagePostsLoad());

    var posts = await GetPostsByUserIdUseCase().getPosts(_userId);

    if (posts.isEmpty) {
      emit(UserPagePostsNoPosts());
    } else {
      emit(UserPagePostsShowPosts(_buildData(posts), _onTap));
    }
  }

  List<UserPagePostPreviewData> _buildData(List<Post> posts) {
    return posts
        .take(3)
        .map((e) =>
            UserPagePostPreviewData(e.title, e.body, _getPostPreviewOnTap(e)))
        .toList();
  }

  void _onTap() {
    Poseidon.instance.navigate(UserPostsPageRoute(_userId));
  }

  void Function() _getPostPreviewOnTap(Post post) => () {
        Poseidon.instance.navigate(PostPageRoute(post));
      };
}
