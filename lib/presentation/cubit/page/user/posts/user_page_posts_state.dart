part of 'user_page_posts_cubit.dart';

@immutable
abstract class UserPagePostsState {}

class UserPagePostsInitial extends UserPagePostsState {}

class UserPagePostsLoad extends UserPagePostsState {}

class UserPagePostsNoPosts extends UserPagePostsState {}

class UserPagePostsShowPosts extends UserPagePostsState {
  final List<UserPagePostPreviewData> data;

  final void Function() onTap;

  UserPagePostsShowPosts(this.data, this.onTap);
}
