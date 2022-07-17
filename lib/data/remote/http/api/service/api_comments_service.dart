import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/add/add_comment_request.dart';
import '../model/request/get/get_comments_by_post_id_request.dart';
import '../model/response/add_comment_response.dart';
import '../model/response/get_comments/get_comments_response.dart';
import '../setting/api_setting.dart';

class ApiCommentsService {
  final Dio _dio = Dio();

  final ApiSetting _setting = GetIt.instance<ApiSetting>();

  Future<GetCommentResponse> getCommentsByPostId(
      GetCommentsByPostIdRequest request) async {
    var queryParameters = <String, dynamic>{'postId': request.postId};

    var response = await _dio.get('${_setting.address}/comments',
        queryParameters: queryParameters);

    return GetCommentResponse.fromJson({'comments': response.data});
  }

  Future<AddCommentResponse> addComment(AddCommentRequest request) async {
    var response = await _dio.post('${_setting.address}/comments',
        data: request.getBody());

    return AddCommentResponse.fromJson({'comment': response.data});
  }
}
