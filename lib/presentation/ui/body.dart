import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/page/users_page/users_page_cubit.dart';
import 'page/users/users_page.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UsersPageCubit()..initialize(),
        child: const UsersPage());
  }
}
