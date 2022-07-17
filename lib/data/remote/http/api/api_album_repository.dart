import 'dart:async';

import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/album.dart';
import '../../../../domain/repository/remote/album_remote_repository.dart';
import 'model/request/get/get_albums_by_user_id_request.dart';
import 'model/response/get_albums/api_album.dart';
import 'service/api_albums_service.dart';

class ApiAlbumRepository extends AlbumRemoteRepository {
  final ApiAlbumsService _service = ApiAlbumsService();

  @override
  Future<List<Album>> getAlbumsByUserId(int userId) async {
    var request = GetAlbumsByUserIdRequest(userId);

    var response = await _service.getAlbumsByUserId(request);

    return response.albums
        .map((e) => MapperBox.instanse.map<ApiAlbum, Album>(e))
        .toList();
  }
}
