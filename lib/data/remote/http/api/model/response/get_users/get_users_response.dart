import 'package:json_annotation/json_annotation.dart';

import 'api_user.dart';

part 'get_users_response.g.dart';

@JsonSerializable(createToJson: false)
class GetUsersResponse {
  final List<ApiUser> users;

  GetUsersResponse(this.users);

  factory GetUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResponseFromJson(json);
}
