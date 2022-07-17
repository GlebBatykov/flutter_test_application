import 'package:get_it/get_it.dart';

import '../model/image.dart';
import '../repository/local/image_local_repository.dart';
import '../repository/remote/image_remote_repository.dart';

class GetImagesByAlbumIdUseCase {
  Future<List<Image>> getImages(int albumId) async {
    var images = <Image>[];

    var imageLocalRepository =
        await GetIt.instance.getAsync<ImageLocalRepository>();

    images.addAll(imageLocalRepository
        .get()
        .where((element) => element.albumId == albumId));

    if (images.isEmpty) {
      var imageRemoteRepository = GetIt.instance<ImageRemoteRepository>();

      var remoteImages =
          await imageRemoteRepository.getImagesByAlbumId(albumId);

      images.addAll(remoteImages);

      imageLocalRepository.addAll(remoteImages);

      await imageLocalRepository.save();
    }

    return images;
  }
}
