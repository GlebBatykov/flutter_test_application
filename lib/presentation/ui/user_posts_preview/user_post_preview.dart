import 'package:flutter/material.dart';

import '../../model/user_page_post_preview_data.dart';
import '../page/user/preview_card.dart';

class UserPostPreview extends StatelessWidget {
  final EdgeInsets margin;

  final UserPagePostPreviewData data;

  const UserPostPreview({Key? key, required this.margin, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);

    return LayoutBuilder(builder: ((context, constraints) {
      return SizedBox(
        height: 150,
        width: constraints.maxWidth,
        child: PreviewCard(
          margin: margin,
          onTap: data.onTap,
          padding: const EdgeInsets.all(15),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                color: Colors.black.withOpacity(0.5),
                blurRadius: 6)
          ],
          children: [
            Text('Title: ${data.title}', style: textStyle),
            const SizedBox(height: 3),
            Text(
              'Body: ${data.body}',
              maxLines: 1,
              style: textStyle,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );
    }));
  }
}
