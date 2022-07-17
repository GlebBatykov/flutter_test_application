part of 'post_page_comments_cubit.dart';

@immutable
abstract class PostPageCommentsState {}

class PostPageCommentsInitial extends PostPageCommentsState {}

class PostPageCommentsLoad extends PostPageCommentsState {}

class PostPageCommentsNoComments extends PostPageCommentsState {}

class PostPageCommentsShowComments extends PostPageCommentsState {
  final List<UserPostPageCommentData> data;

  PostPageCommentsShowComments(this.data);
}
