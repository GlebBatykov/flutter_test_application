import 'package:get_it/get_it.dart';

import '../model/album.dart';
import '../repository/local/album_local_repository.dart';
import '../repository/remote/album_remote_repository.dart';

class GetAlbumsByUserIdUseCase {
  Future<List<Album>> getAlbums(int userId) async {
    var albums = <Album>[];

    var albumLocalRepository =
        await GetIt.instance.getAsync<AlbumLocalRepository>();

    albums.addAll(albumLocalRepository
        .get()
        .where((element) => element.userId == userId));

    if (albums.isEmpty) {
      var albumRemoteRepository = GetIt.instance<AlbumRemoteRepository>();

      var remoteAlbums = await albumRemoteRepository.getAlbumsByUserId(userId);

      albums.addAll(remoteAlbums);

      albumLocalRepository.addAll(remoteAlbums);

      await albumLocalRepository.save();
    }

    return albums;
  }
}
