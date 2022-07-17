import 'package:hive_flutter/hive_flutter.dart';

import 'data/local/database/hive/model/hive_album.dart';
import 'data/local/database/hive/model/hive_comment.dart';
import 'data/local/database/hive/model/hive_company.dart';
import 'data/local/database/hive/model/hive_image.dart';
import 'data/local/database/hive/model/hive_post.dart';
import 'data/local/database/hive/model/hive_user.dart';

class HiveRegister {
  Future<void> register() async {
    await Hive.initFlutter();

    Hive.registerAdapter(HiveAlbumAdapter());
    Hive.registerAdapter(HiveCommentAdapter());
    Hive.registerAdapter(HiveCompanyAdapter());
    Hive.registerAdapter(HivePostAdapter());
    Hive.registerAdapter(HiveUserAdapter());
    Hive.registerAdapter(HiveImageAdapter());
  }
}
