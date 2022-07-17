import 'package:hive/hive.dart';

import 'hive_company.dart';

part 'hive_user.g.dart';

@HiveType(typeId: 4)
class HiveUser {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final String website;

  @HiveField(6)
  final List<HiveCompany> working;

  @HiveField(7)
  final String address;

  HiveUser(this.id, this.username, this.name, this.email, this.phone,
      this.website, this.working, this.address);
}
