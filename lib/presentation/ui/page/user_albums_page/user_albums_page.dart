import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/page/user_albums/user_albums_page_cubit.dart';
import '../../user_albums_preview/user_page_albums_preview.dart';

class UserAlbumsPage extends StatelessWidget {
  const UserAlbumsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);

    return Scaffold(
      appBar: AppBar(
        title: const Text('All albums'),
      ),
      body: BlocBuilder<UserAlbumsPageCubit, UserAlbumsPageState>(
          builder: (context, state) {
        if (state is UserAlbumsPageLoad) {
          return const Center(child: Text('Load posts...', style: textStyle));
        } else if (state is UserAlbumsPageNoPosts) {
          return const Center(child: Text('No posts', style: textStyle));
        } else if (state is UserAlbumsPageShowPosts) {
          return SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.all(15),
                child: UserAlbumsPreview(data: state.data)),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
