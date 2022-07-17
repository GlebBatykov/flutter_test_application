import 'dart:async';

import '../../model/image.dart';

abstract class ImageRemoteRepository {
  FutureOr<List<Image>> getImagesByAlbumId(int albumId);
}
