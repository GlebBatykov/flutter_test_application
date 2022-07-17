part of 'add_comment_page_cubit.dart';

@immutable
abstract class AddCommentPageState {}

class AddCommentPageInitial extends AddCommentPageState {}

class AddCommentPageShow extends AddCommentPageState {
  final GlobalKey<FormState> formKey;

  final TextEditingController nameEditingController;

  final TextEditingController emailEditingController;

  final TextEditingController textEditingController;

  final void Function() onPressed;

  AddCommentPageShow(this.formKey, this.nameEditingController,
      this.emailEditingController, this.textEditingController, this.onPressed);
}
