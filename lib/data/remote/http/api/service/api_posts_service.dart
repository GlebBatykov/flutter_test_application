import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/get/get_posts_by_user_id_request.dart';
import '../model/response/get_posts/get_posts_response.dart';
import '../setting/api_setting.dart';

class ApiPostsService {
  final Dio _dio = Dio();

  final ApiSetting _setting = GetIt.instance<ApiSetting>();

  Future<GetPostsResponse> getPostsByUserId(
      GetPostsByUserIdRequest request) async {
    var queryParameters = <String, dynamic>{'userId': request.userId};

    var response = await _dio.get('${_setting.address}/posts',
        queryParameters: queryParameters);

    return GetPostsResponse.fromJson({'posts': response.data});
  }
}
