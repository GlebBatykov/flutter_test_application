import 'dart:async';

import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/user.dart';
import '../../../../domain/repository/remote/user_remote_repository.dart';
import 'model/response/get_users/api_user.dart';
import 'service/api_users_service.dart';

class ApiUserRepository extends UserRemoteRepository {
  final ApiUsersService _service = ApiUsersService();

  @override
  Future<List<User>> getUsers() async {
    var response = await _service.getUsers();

    return response.users
        .map((e) => MapperBox.instanse.map<ApiUser, User>(e))
        .toList();
  }
}
