import 'package:get_it/get_it.dart';

import 'data/local/database/hive/hive_album_repository.dart';
import 'data/local/database/hive/hive_comment_repository.dart';
import 'data/local/database/hive/hive_image_repository.dart';
import 'data/local/database/hive/hive_post_repository.dart';
import 'data/local/database/hive/hive_user_repository.dart';
import 'data/remote/http/api/api_album_repository.dart';
import 'data/remote/http/api/api_comment_repository.dart';
import 'data/remote/http/api/api_image_repository.dart';
import 'data/remote/http/api/api_post_repository.dart';
import 'data/remote/http/api/api_user_repository.dart';
import 'data/remote/http/api/setting/api_setting.dart';
import 'data/remote/http/api/setting/release_api_setting.dart';
import 'domain/repository/local/album_local_repository.dart';
import 'domain/repository/local/comment_local_repository.dart';
import 'domain/repository/local/image_local_repository.dart';
import 'domain/repository/local/post_local_repository.dart';
import 'domain/repository/local/user_local_repository.dart';
import 'domain/repository/remote/album_remote_repository.dart';
import 'domain/repository/remote/comment_remote_repository.dart';
import 'domain/repository/remote/image_remote_repository.dart';
import 'domain/repository/remote/post_remote_repository.dart';
import 'domain/repository/remote/user_remote_repository.dart';

class InjectionContainer {
  void initialize() {
    var getIt = GetIt.instance;

    getIt.registerSingleton<ApiSetting>(ReleaseApiSetting());

    getIt
        .registerLazySingleton<UserRemoteRepository>(() => ApiUserRepository());
    getIt
        .registerLazySingleton<PostRemoteRepository>(() => ApiPostRepository());
    getIt.registerLazySingleton<ImageRemoteRepository>(
        () => ApiImageRepository());
    getIt.registerLazySingleton<CommentRemoteRepository>(
        () => ApiCommentRepository());
    getIt.registerLazySingleton<AlbumRemoteRepository>(
        () => ApiAlbumRepository());

    getIt.registerLazySingletonAsync<UserLocalRepository>(() async {
      var repository = HiveUserRepository();

      await repository.load();

      return repository;
    });
    getIt.registerLazySingletonAsync<PostLocalRepository>(() async {
      var repository = HivePostRepository();

      await repository.load();

      return repository;
    });
    getIt.registerLazySingletonAsync<ImageLocalRepository>(() async {
      var repository = HiveImageRepository();

      await repository.load();

      return repository;
    });
    getIt.registerLazySingletonAsync<CommentLocalRepository>(() async {
      var repository = HiveCommentRepository();

      await repository.load();

      return repository;
    });
    getIt.registerLazySingletonAsync<AlbumLocalRepository>(() async {
      var repository = HiveAlbumRepository();

      await repository.load();

      return repository;
    });
  }
}
