import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/get/get_images_by_album_id_request.dart';
import '../model/response/get_images/get_images_response.dart';
import '../setting/api_setting.dart';

class ApiImagesService {
  final Dio _dio = Dio();

  final ApiSetting _setting = GetIt.instance<ApiSetting>();

  Future<GetImagesResponse> getImagesByAlbumId(
      GetImagesByAlbumIdRequest request) async {
    var queryParameters = <String, dynamic>{'albumId': request.albumId};

    var response = await _dio.get('${_setting.address}/images',
        queryParameters: queryParameters);

    return GetImagesResponse.fromJson({'images': response.data});
  }
}
