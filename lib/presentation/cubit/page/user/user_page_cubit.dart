import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../domain/model/company.dart';
import '../../../../domain/model/user.dart';
import 'albums/user_page_albums_cubit.dart';
import 'posts/user_page_posts_cubit.dart';

part 'user_page_state.dart';

class UserPageCubit extends Cubit<UserPageState> {
  late final User _user;

  late final UserPageAlbumsCubit _albumsCubit;

  late final UserPagePostsCubit _postsCubit;

  UserPageCubit(User user)
      : _user = user,
        super(UserPageInitial()) {
    _initialize();
  }

  void _initialize() {
    _albumsCubit = UserPageAlbumsCubit(_user.id);

    _postsCubit = UserPagePostsCubit(_user.id);

    emit(UserPageShow(
        _user.username,
        _user.name,
        _user.email,
        _user.phone,
        _user.website,
        _user.working,
        _user.address,
        _albumsCubit,
        _postsCubit));
  }

  Future<void> initialize() async {
    await Future.wait([_albumsCubit.initialize(), _postsCubit.initialize()]);
  }
}
