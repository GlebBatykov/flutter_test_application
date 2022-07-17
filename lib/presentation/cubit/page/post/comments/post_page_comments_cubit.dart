import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/model/comment.dart';
import '../../../../../domain/use_case/get_comments_by_post_id_use_case.dart';
import '../../../../model/user_post_page_comment_data.dart';

part 'post_page_comments_state.dart';

class PostPageCommentsCubit extends Cubit<PostPageCommentsState> {
  final int _postId;

  PostPageCommentsCubit(int postId)
      : _postId = postId,
        super(PostPageCommentsInitial());

  Future<void> initialize() async {
    emit(PostPageCommentsLoad());

    var comments = await GetCommentsByPostIdUseCase().getComments(_postId);

    if (comments.isEmpty) {
      emit(PostPageCommentsNoComments());
    } else {
      emit(PostPageCommentsShowComments(_buildData(comments)));
    }
  }

  List<UserPostPageCommentData> _buildData(List<Comment> comments) {
    return comments
        .map((e) => UserPostPageCommentData(e.name, e.email, e.text))
        .toList();
  }
}
