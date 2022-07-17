import 'package:hive/hive.dart';

part 'hive_post.g.dart';

@HiveType(typeId: 3)
class HivePost {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int userId;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String body;

  HivePost(this.id, this.userId, this.title, this.body);
}
