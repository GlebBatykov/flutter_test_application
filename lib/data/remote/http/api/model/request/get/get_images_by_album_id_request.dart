import '../request.dart';

class GetImagesByAlbumIdRequest extends Request {
  final int albumId;

  GetImagesByAlbumIdRequest(this.albumId);
}
