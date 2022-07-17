import 'package:flutter/material.dart';

import '../../model/user_page_album_preview_data.dart';
import '../page/user/preview_card.dart';

class UserAlbumPreview extends StatelessWidget {
  final EdgeInsets margin;

  final UserPageAlbumPreviewData data;

  const UserAlbumPreview({Key? key, required this.margin, required this.data})
      : super(key: key);

  Widget _buildImagePreview(UserPageAlbumPreviewData data) {
    var image = data.image;

    return image != null
        ? Image.network(
            image.url,
            height: 125,
            width: 125,
          )
        : const Text('No images', style: TextStyle(fontSize: 16));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return SizedBox(
        height: 225,
        width: constraints.maxWidth,
        child: PreviewCard(
          margin: margin,
          onTap: data.onTap,
          padding: const EdgeInsets.all(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                color: Colors.black.withOpacity(0.5),
                blurRadius: 6)
          ],
          children: [
            Text('Title: ${data.title}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            _buildImagePreview(data)
          ],
        ),
      );
    }));
  }
}
