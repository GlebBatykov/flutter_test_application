import 'package:hive/hive.dart';

part 'hive_comment.g.dart';

@HiveType(typeId: 1)
class HiveComment {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int postId;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String text;

  HiveComment(this.id, this.postId, this.name, this.email, this.text);
}
