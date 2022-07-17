import 'package:hive/hive.dart';

part 'hive_album.g.dart';

@HiveType(typeId: 0)
class HiveAlbum {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int userId;

  @HiveField(2)
  final String title;

  HiveAlbum(this.id, this.userId, this.title);
}
