import 'dart:async';

import '../../model/album.dart';

abstract class AlbumRemoteRepository {
  FutureOr<List<Album>> getAlbumsByUserId(int userId);
}
