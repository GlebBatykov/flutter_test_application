import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/page/post/comments/post_page_comments_cubit.dart';
import '../../../../model/user_post_page_comment_data.dart';
import 'post_page_comment.dart';

class PostPageComments extends StatelessWidget {
  const PostPageComments({Key? key}) : super(key: key);

  List<Widget> _buildComments(List<UserPostPageCommentData> data) {
    var content = <Widget>[];

    var length = data.length;

    for (var i = 0; i < length; i++) {
      content.add(PostPageComment(
        data: data[i],
        margin: _getMargin(i, length),
      ));
    }

    return content;
  }

  EdgeInsets _getMargin(int index, int length) {
    return index == 0
        ? const EdgeInsets.only(top: 10, bottom: 5)
        : index < length - 1
            ? const EdgeInsets.only(top: 5, bottom: 5)
            : const EdgeInsets.only(top: 5, bottom: 10);
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);

    return BlocBuilder<PostPageCommentsCubit, PostPageCommentsState>(
        builder: ((context, state) {
      if (state is PostPageCommentsLoad) {
        return const Text('Load comments...', style: textStyle);
      } else if (state is PostPageCommentsNoComments) {
        return const Text('No comments', style: textStyle);
      } else if (state is PostPageCommentsShowComments) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Comments:',
            style: textStyle,
          ),
          const SizedBox(height: 10),
          ..._buildComments(state.data)
        ]);
      } else {
        return Container();
      }
    }));
  }
}
