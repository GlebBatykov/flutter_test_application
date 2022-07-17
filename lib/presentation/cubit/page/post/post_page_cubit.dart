import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../domain/model/post.dart';
import '../../../navigation/add_comment_page_route.dart';
import 'comments/post_page_comments_cubit.dart';

part 'post_page_state.dart';

class PostPageCubit extends Cubit<PostPageState> {
  final Post _post;

  late final PostPageCommentsCubit _commentsCubit;

  PostPageCubit(Post post)
      : _post = post,
        super(PostPageInitial()) {
    _initialize();
  }

  void _initialize() {
    _commentsCubit = PostPageCommentsCubit(_post.id);

    emit(PostPageShow(_post.title, _post.body, _commentsCubit, _onPressed));
  }

  void _onPressed() {
    Poseidon.instance
        .navigate(AddCommentPageRoute(_post.id, onAdding: _onAdding));
  }

  void _onAdding() {
    _commentsCubit.initialize();
  }

  Future<void> initialize() async {
    await _commentsCubit.initialize();
  }
}
