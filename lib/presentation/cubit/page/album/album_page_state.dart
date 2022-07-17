part of 'album_page_cubit.dart';

@immutable
abstract class AlbumPageState {}

class AlbumPageInitial extends AlbumPageState {}

class AlbumPageLoad extends AlbumPageState {}

class AlbumPageNoImages extends AlbumPageState {}

class AlbumPageShowImages extends AlbumPageState {
  final List<AlbumPageImageData> data;

  AlbumPageShowImages(this.data);
}
