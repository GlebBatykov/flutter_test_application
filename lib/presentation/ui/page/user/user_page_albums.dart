import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/page/user/albums/user_page_albums_cubit.dart';
import '../../user_albums_preview/user_page_albums_preview.dart';

class UserPageAlbums extends StatelessWidget {
  const UserPageAlbums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);

    return BlocBuilder<UserPageAlbumsCubit, UserPageAlbumsState>(
        builder: (context, state) {
      if (state is UserPageAlbumsLoad) {
        return const Text('Albums load...', style: textStyle);
      } else if (state is UserPageAlbumsNoAlbums) {
        return const Text('No albums', style: textStyle);
      } else if (state is UserPageAlbumsShowAlbums) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Albums:', style: textStyle),
                  TextButton(
                      onPressed: state.onTap,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text('All'))
                ],
              ),
            ),
            UserAlbumsPreview(data: state.data)
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
