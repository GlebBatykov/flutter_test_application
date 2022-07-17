import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poseidon/poseidon.dart';

import '../../domain/model/album.dart';
import '../cubit/page/album/album_page_cubit.dart';
import '../ui/page/album/album_page.dart';

class AlbumPageRoute extends PoseidonRoute {
  final Album album;

  AlbumPageRoute(this.album);

  @override
  MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<AlbumPageCubit>(
            create: (context) => AlbumPageCubit(album)..initialize(),
            child: const AlbumPage()));
  }
}
