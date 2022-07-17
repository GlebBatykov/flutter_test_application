import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application/presentation/navigation/user_albums_page_route.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../../domain/model/album.dart';
import '../../../../../domain/use_case/get_albums_by_user_id_use_case.dart';
import '../../../../../domain/use_case/get_images_by_album_id_use_case.dart';
import '../../../../model/user_page_album_preview_data.dart';
import '../../../../navigation/album_page_route.dart';

part 'user_page_albums_state.dart';

class UserPageAlbumsCubit extends Cubit<UserPageAlbumsState> {
  final int _userId;

  UserPageAlbumsCubit(int userId)
      : _userId = userId,
        super(UserPageAlbumsInitial());

  Future<void> initialize() async {
    emit(UserPageAlbumsLoad());

    var albums = await GetAlbumsByUserIdUseCase().getAlbums(_userId);

    if (albums.isEmpty) {
      emit(UserPageAlbumsNoAlbums());
    } else {
      emit(UserPageAlbumsShowAlbums(await _buildData(albums), _onTap));
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

  void _onTap() {
    Poseidon.instance.navigate(UserAlbumsPageRoute(_userId));
  }

  void Function() _getAlbumPreviewOnTap(Album album) => () {
        Poseidon.instance.navigate(AlbumPageRoute(album));
      };
}
