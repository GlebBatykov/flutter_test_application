import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poseidon/poseidon.dart';

import '../cubit/page/user_albums/user_albums_page_cubit.dart';
import '../ui/page/user_albums_page/user_albums_page.dart';

class UserAlbumsPageRoute extends PoseidonRoute {
  final int userId;

  UserAlbumsPageRoute(this.userId);

  @override
  MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<UserAlbumsPageCubit>(
            create: (context) => UserAlbumsPageCubit(userId)..initialize(),
            child: const UserAlbumsPage()));
  }
}
