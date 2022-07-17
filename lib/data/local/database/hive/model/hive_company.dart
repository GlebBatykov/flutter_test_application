import 'package:hive/hive.dart';

part 'hive_company.g.dart';

@HiveType(typeId: 2)
class HiveCompany {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String address;

  @HiveField(2)
  final String catchPhrase;

  HiveCompany(this.name, this.address, this.catchPhrase);
}
