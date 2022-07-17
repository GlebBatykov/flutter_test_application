part of 'post_page_cubit.dart';

@immutable
abstract class PostPageState {}

class PostPageInitial extends PostPageState {}

class PostPageShow extends PostPageState {
  final String title;

  final String body;

  final PostPageCommentsCubit commentsCubit;

  final void Function() onPressed;

  PostPageShow(this.title, this.body, this.commentsCubit, this.onPressed);
}
