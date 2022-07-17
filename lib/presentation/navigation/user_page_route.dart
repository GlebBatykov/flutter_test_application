import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poseidon/poseidon.dart';

import '../../domain/model/user.dart';
import '../cubit/page/user/user_page_cubit.dart';
import '../ui/page/user/user_page.dart';

class UserPageRoute extends PoseidonRoute {
  final User user;

  UserPageRoute(this.user);

  @override
  MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<UserPageCubit>(
            create: (context) => UserPageCubit(user)..initialize(),
            child: const UserPage()));
  }
}
