import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/get/get_albums_by_user_id_request.dart';
import '../model/response/get_albums/get_albums_response.dart';
import '../setting/api_setting.dart';

class ApiAlbumsService {
  final Dio _dio = Dio();

  final ApiSetting _setting = GetIt.instance<ApiSetting>();

  Future<GetAlbumsResponse> getAlbumsByUserId(
      GetAlbumsByUserIdRequest request) async {
    var queryParameters = <String, dynamic>{'userId': request.userId};

    var response = await _dio.get('${_setting.address}/albums',
        queryParameters: queryParameters);

    return GetAlbumsResponse.fromJson({'albums': response.data});
  }
}
