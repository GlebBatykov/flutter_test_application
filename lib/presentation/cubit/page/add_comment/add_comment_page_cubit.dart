import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../domain/repository/local/comment_local_repository.dart';
import '../../../../domain/repository/remote/comment_remote_repository.dart';

part 'add_comment_page_state.dart';

class AddCommentPageCubit extends Cubit<AddCommentPageState> {
  final int _postId;

  final void Function()? _onAdding;

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _nameEditingController = TextEditingController();

  final TextEditingController _emailEditingController = TextEditingController();

  final TextEditingController _textEditingController = TextEditingController();

  bool _addingActive = false;

  AddCommentPageCubit(int postId, {void Function()? onAdding})
      : _postId = postId,
        _onAdding = onAdding,
        super(AddCommentPageInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(AddCommentPageShow(_formKey, _nameEditingController,
        _emailEditingController, _textEditingController, _onPressed));
  }

  void _onPressed() {
    if (_formKey.currentState!.validate() && !_addingActive) {
      _addingActive = true;

      _addComment().then((value) {
        _addingActive = false;

        _onAdding?.call();

        Poseidon.instance.pop();
      });
    }
  }

  Future<void> _addComment() async {
    var commentRemoteRepository = GetIt.instance<CommentRemoteRepository>();

    var name = _nameEditingController.text,
        email = _emailEditingController.text,
        text = _textEditingController.text;

    var comment =
        await commentRemoteRepository.addComment(_postId, name, email, text);

    var commentLocalRepository =
        await GetIt.instance.getAsync<CommentLocalRepository>();

    commentLocalRepository.add(comment);

    await commentLocalRepository.save();
  }
}
