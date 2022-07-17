import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/response/get_users/get_users_response.dart';
import '../setting/api_setting.dart';

class ApiUsersService {
  final Dio _dio = Dio();

  final ApiSetting _setting = GetIt.instance<ApiSetting>();

  Future<GetUsersResponse> getUsers() async {
    var response = await _dio.get('${_setting.address}/users');

    return GetUsersResponse.fromJson({'users': response.data});
  }
}
