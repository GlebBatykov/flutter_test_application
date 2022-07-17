import 'package:flutter_test_application/data/remote/http/api/model/request/request.dart';

class AddCommentRequest extends Request {
  final int postId;

  final String name;

  final String email;

  final String text;

  AddCommentRequest(this.postId, this.name, this.email, this.text);

  @override
  Map<String, dynamic> getBody() =>
      {'postId': postId, 'name': name, 'email': email, 'text': text};
}
