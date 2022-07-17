import 'package:json_annotation/json_annotation.dart';

import 'api_company.dart';

part 'api_user.g.dart';

@JsonSerializable(createToJson: false)
class ApiUser {
  final int id;

  final String username;

  final String name;

  final String email;

  final String phone;

  final String website;

  final List<ApiCompany> working;

  final String address;

  ApiUser(this.id, this.username, this.name, this.email, this.phone,
      this.website, this.working, this.address);

  factory ApiUser.fromJson(Map<String, dynamic> json) =>
      _$ApiUserFromJson(json);
}
