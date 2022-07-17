part of 'user_page_albums_cubit.dart';

@immutable
abstract class UserPageAlbumsState {}

class UserPageAlbumsInitial extends UserPageAlbumsState {}

class UserPageAlbumsLoad extends UserPageAlbumsState {}

class UserPageAlbumsNoAlbums extends UserPageAlbumsState {}

class UserPageAlbumsShowAlbums extends UserPageAlbumsState {
  final List<UserPageAlbumPreviewData> data;

  final void Function() onTap;

  UserPageAlbumsShowAlbums(this.data, this.onTap);
}
