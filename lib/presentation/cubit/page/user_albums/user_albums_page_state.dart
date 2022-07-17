part of 'user_albums_page_cubit.dart';

@immutable
abstract class UserAlbumsPageState {}

class UserAlbumsPageInitial extends UserAlbumsPageState {}

class UserAlbumsPageLoad extends UserAlbumsPageState {}

class UserAlbumsPageNoPosts extends UserAlbumsPageState {}

class UserAlbumsPageShowPosts extends UserAlbumsPageState {
  final List<UserPageAlbumPreviewData> data;

  UserAlbumsPageShowPosts(this.data);
}
