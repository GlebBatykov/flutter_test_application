import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/comment.dart';
import '../../../../domain/repository/local/comment_local_repository.dart';
import 'model/hive_comment.dart';

class HiveCommentRepository extends CommentLocalRepository {
  final List<Comment> _comments = [];

  @override
  bool get isEmpty => _comments.isEmpty;

  @override
  bool get isNotEmpty => _comments.isNotEmpty;

  @override
  void add(Comment data) {
    _comments.add(data);
  }

  @override
  void addAll(List<Comment> data) {
    _comments.addAll(data);
  }

  @override
  List<Comment> get() => List.unmodifiable(_comments);

  @override
  Future<void> load() async {
    var box = await _openBox();

    var comments =
        box.values.map((e) => MapperBox.instanse.map<HiveComment, Comment>(e));

    _comments.clear();

    _comments.addAll(comments);

    await box.close();
  }

  @override
  Future<void> save() async {
    var box = await _openBox();

    var comments =
        _comments.map((e) => MapperBox.instanse.map<Comment, HiveComment>(e));

    await box.clear();

    await box.addAll(comments);

    await box.close();
  }

  Future<Box<HiveComment>> _openBox() => Hive.openBox('comment');
}
