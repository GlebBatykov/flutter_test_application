import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/page/user/posts/user_page_posts_cubit.dart';
import '../../user_posts_preview/user_posts_preview.dart';

class UserPagePosts extends StatelessWidget {
  const UserPagePosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);

    return BlocBuilder<UserPagePostsCubit, UserPagePostsState>(
        builder: (context, state) {
      if (state is UserPagePostsLoad) {
        return const Text('Load posts...', style: textStyle);
      } else if (state is UserPagePostsNoPosts) {
        return const Text('No posts');
      } else if (state is UserPagePostsShowPosts) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Posts:', style: textStyle),
                  TextButton(onPressed: state.onTap, child: const Text('All'))
                ],
              ),
            ),
            UserPostsPreview(data: state.data)
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
