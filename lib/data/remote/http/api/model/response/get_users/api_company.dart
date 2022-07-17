import 'package:json_annotation/json_annotation.dart';

part 'api_company.g.dart';

@JsonSerializable(createToJson: false)
class ApiCompany {
  final String name;

  final String address;

  final String catchPhrase;

  ApiCompany(this.name, this.address, this.catchPhrase);

  factory ApiCompany.fromJson(Map<String, dynamic> json) =>
      _$ApiCompanyFromJson(json);
}
