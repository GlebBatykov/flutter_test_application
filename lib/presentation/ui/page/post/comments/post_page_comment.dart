import 'package:flutter/material.dart';

import '../../../../model/user_post_page_comment_data.dart';

class PostPageComment extends StatelessWidget {
  final EdgeInsets? margin;

  final UserPostPageCommentData data;

  const PostPageComment({Key? key, this.margin, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        padding: const EdgeInsets.all(15),
        margin: margin,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2.5),
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 8)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${data.name}', style: textStyle),
            const SizedBox(height: 5),
            Text('Email: ${data.email}', style: textStyle),
            const SizedBox(height: 5),
            Text('Text: ${data.text}', style: textStyle)
          ],
        ),
      );
    });
  }
}
