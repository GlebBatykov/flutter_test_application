import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poseidon/poseidon.dart';

import '../../domain/model/post.dart';
import '../cubit/page/post/post_page_cubit.dart';
import '../ui/page/post/post_page.dart';

class PostPageRoute extends PoseidonRoute {
  final Post post;

  PostPageRoute(this.post);

  @override
  MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<PostPageCubit>(
            create: (context) => PostPageCubit(post)..initialize(),
            child: const PostPage()));
  }
}
