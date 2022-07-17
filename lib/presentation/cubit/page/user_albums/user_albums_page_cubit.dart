import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../domain/model/album.dart';
import '../../../../domain/use_case/get_albums_by_user_id_use_case.dart';
import '../../../../domain/use_case/get_images_by_album_id_use_case.dart';
import '../../../model/user_page_album_preview_data.dart';
import '../../../navigation/album_page_route.dart';

part 'user_albums_page_state.dart';

class UserAlbumsPageCubit extends Cubit<UserAlbumsPageState> {
  final int _userId;

  UserAlbumsPageCubit(int userId)
      : _userId = userId,
        super(UserAlbumsPageInitial());

  Future<void> initialize() async {
    emit(UserAlbumsPageLoad());

    var albums = await GetAlbumsByUserIdUseCase().getAlbums(_userId);

    if (albums.isEmpty) {
      emit(UserAlbumsPageNoPosts());
    } else {
      emit(UserAlbumsPageShowPosts(await _buildData(albums)));
    }
  }

  Future<List<UserPageAlbumPreviewData>> _buildData(List<Album> albums) async {
    var data = <UserPageAlbumPreviewData>[];

    for (var album in albums.take(3)) {
      var images = await GetImagesByAlbumIdUseCase().getImages(album.id);

      var image = images.isNotEmpty ? images.first : null;

      data.add(UserPageAlbumPreviewData(
          album.title, image, _getAlbumPreviewOnTap(album)));
    }

    return data;
  }

  void Function() _getAlbumPreviewOnTap(Album album) => () {
        Poseidon.instance.navigate(AlbumPageRoute(album));
      };
}
