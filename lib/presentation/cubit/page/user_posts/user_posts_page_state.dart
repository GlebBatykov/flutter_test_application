part of 'user_posts_page_cubit.dart';

@immutable
abstract class UserPostsPageState {}

class UserPostsPageInitial extends UserPostsPageState {}

class UserPostsPageLoad extends UserPostsPageState {}

class UserPostsPageNoPosts extends UserPostsPageState {}

class UserPostsPageShowPosts extends UserPostsPageState {
  final List<UserPagePostPreviewData> data;

  UserPostsPageShowPosts(this.data);
}
