import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../../domain/model/user.dart';
import '../../../../../domain/use_case/get_users_use_case.dart';
import '../../../model/user_card_data.dart';
import '../../../navigation/user_page_route.dart';

part 'users_page_state.dart';

class UsersPageCubit extends Cubit<UsersPageState> {
  UsersPageCubit() : super(UsersPageInitial());

  Future<void> initialize() async {
    emit(UsersPageLoad());

    var users = await GetUsersUserCase().getUsers();

    if (users.isEmpty) {
      emit(UsersPageNoUsers());
    } else {
      emit(UsersPageShowUsers(users
          .map((e) => UserCardData(e.username, e.name, _getUserCardOnTap(e)))
          .toList()));
    }
  }

  void Function() _getUserCardOnTap(User user) => () {
        Poseidon.instance.navigate(UserPageRoute(user));
      };
}
