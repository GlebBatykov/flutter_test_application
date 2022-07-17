import '../request.dart';

class GetCommentsByPostIdRequest extends Request {
  final int postId;

  GetCommentsByPostIdRequest(this.postId);
}
