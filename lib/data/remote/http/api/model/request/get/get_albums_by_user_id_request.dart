import '../request.dart';

class GetAlbumsByUserIdRequest extends Request {
  final int userId;

  GetAlbumsByUserIdRequest(this.userId);
}
