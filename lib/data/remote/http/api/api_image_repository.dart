import 'dart:async';

import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/image.dart';
import '../../../../domain/repository/remote/image_remote_repository.dart';
import 'model/request/get/get_images_by_album_id_request.dart';
import 'model/response/get_images/api_image.dart';
import 'service/api_images_service.dart';

class ApiImageRepository extends ImageRemoteRepository {
  final ApiImagesService _service = ApiImagesService();

  @override
  Future<List<Image>> getImagesByAlbumId(int albumId) async {
    var request = GetImagesByAlbumIdRequest(albumId);

    var response = await _service.getImagesByAlbumId(request);

    return response.images
        .map((e) => MapperBox.instanse.map<ApiImage, Image>(e))
        .toList();
  }
}
