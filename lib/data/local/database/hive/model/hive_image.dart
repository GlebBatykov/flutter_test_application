import 'package:hive/hive.dart';

part 'hive_image.g.dart';

@HiveType(typeId: 5)
class HiveImage {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int albumId;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String url;

  HiveImage(this.id, this.albumId, this.title, this.url);
}
