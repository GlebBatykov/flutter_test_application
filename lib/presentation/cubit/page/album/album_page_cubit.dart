import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../domain/model/album.dart';
import '../../../../domain/use_case/get_images_by_album_id_use_case.dart';
import '../../../model/album_page_image_data.dart';
import '../../../../domain/model/image.dart' as image;

part 'album_page_state.dart';

class AlbumPageCubit extends Cubit<AlbumPageState> {
  final Album _album;

  AlbumPageCubit(Album album)
      : _album = album,
        super(AlbumPageInitial());

  Future<void> initialize() async {
    emit(AlbumPageLoad());

    var images = await GetImagesByAlbumIdUseCase().getImages(_album.id);

    if (images.isEmpty) {
      emit(AlbumPageNoImages());
    } else {
      emit(AlbumPageShowImages(_buildData(images)));
    }
  }

  List<AlbumPageImageData> _buildData(List<image.Image> images) {
    return images.map((e) => AlbumPageImageData(e.title, e.url)).toList();
  }
}
