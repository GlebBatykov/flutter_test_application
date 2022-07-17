import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/page/users_page/users_page_cubit.dart';
import 'user_card.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersPageCubit, UsersPageState>(
        builder: (context, state) {
      if (state is UsersPageLoad) {
        return const Center(
          child: Text('Loading...'),
        );
      } else if (state is UsersPageNoUsers) {
        return const Center(
          child: Text('No users'),
        );
      } else if (state is UsersPageShowUsers) {
        var data = state.data;

        return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return UserCard(data: data[index]);
            });
      } else {
        return Container();
      }
    });
  }
}
