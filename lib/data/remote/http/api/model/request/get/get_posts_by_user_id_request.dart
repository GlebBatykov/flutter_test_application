import '../request.dart';

class GetPostsByUserIdRequest extends Request {
  final int userId;

  GetPostsByUserIdRequest(this.userId);
}
