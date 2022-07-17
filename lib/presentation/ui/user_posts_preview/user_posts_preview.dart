import 'package:flutter/material.dart';

import '../../model/user_page_post_preview_data.dart';
import 'user_post_preview.dart';

class UserPostsPreview extends StatelessWidget {
  final List<UserPagePostPreviewData> data;

  const UserPostsPreview({Key? key, required this.data}) : super(key: key);

  List<Widget> _buildPostsPreview() {
    var length = data.length;

    var content = <Widget>[];

    for (var i = 0; i < length; i++) {
      content.add(UserPostPreview(
          data: data[i], margin: const EdgeInsets.only(top: 10, bottom: 10)));
    }

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildPostsPreview(),
    );
  }
}
