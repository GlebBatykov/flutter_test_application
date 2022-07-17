import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/page/user_posts/user_posts_page_cubit.dart';
import '../../user_posts_preview/user_posts_preview.dart';

class UserPostsPage extends StatelessWidget {
  const UserPostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);

    return Scaffold(
      appBar: AppBar(
        title: const Text('All posts'),
      ),
      body: BlocBuilder<UserPostsPageCubit, UserPostsPageState>(
          builder: (context, state) {
        if (state is UserPostsPageLoad) {
          return const Center(
            child: Text('Load posts...', style: textStyle),
          );
        } else if (state is UserPostsPageNoPosts) {
          return const Center(child: Text('No posts', style: textStyle));
        } else if (state is UserPostsPageShowPosts) {
          return SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.all(15),
                child: UserPostsPreview(data: state.data)),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
