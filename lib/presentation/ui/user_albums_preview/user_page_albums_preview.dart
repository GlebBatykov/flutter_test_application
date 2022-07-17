import 'package:flutter/material.dart';

import '../../model/user_page_album_preview_data.dart';
import 'user_page_album_preview.dart';

class UserAlbumsPreview extends StatelessWidget {
  final List<UserPageAlbumPreviewData> data;

  const UserAlbumsPreview({Key? key, required this.data}) : super(key: key);

  List<Widget> _buildAlbumsPreview() {
    var length = data.length;

    var content = <Widget>[];

    for (var i = 0; i < length; i++) {
      content.add(UserAlbumPreview(
          data: data[i], margin: const EdgeInsets.only(top: 10, bottom: 10)));
    }

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildAlbumsPreview(),
    );
  }
}
