import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poseidon/poseidon.dart';

import '../cubit/page/user_posts/user_posts_page_cubit.dart';
import '../ui/page/user_posts/user_posts_page.dart';

class UserPostsPageRoute extends PoseidonRoute {
  final int userId;

  UserPostsPageRoute(this.userId);

  @override
  MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<UserPostsPageCubit>(
              create: (context) => UserPostsPageCubit(userId)..initialize(),
              child: const UserPostsPage(),
            ));
  }
}
