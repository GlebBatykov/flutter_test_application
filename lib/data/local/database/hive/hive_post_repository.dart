import 'dart:async';

import 'package:hive/hive.dart';
import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/post.dart';
import '../../../../domain/repository/local/post_local_repository.dart';
import 'model/hive_post.dart';

class HivePostRepository extends PostLocalRepository {
  final List<Post> _posts = [];

  @override
  bool get isEmpty => _posts.isEmpty;

  @override
  bool get isNotEmpty => _posts.isNotEmpty;

  @override
  void add(Post data) {
    _posts.add(data);
  }

  @override
  void addAll(List<Post> data) {
    _posts.addAll(data);
  }

  @override
  List<Post> get() => List.unmodifiable(_posts);

  @override
  Future<void> load() async {
    var box = await _openBox();

    var posts =
        box.values.map((e) => MapperBox.instanse.map<HivePost, Post>(e));

    _posts.clear();

    _posts.addAll(posts);

    await box.close();
  }

  @override
  Future<void> save() async {
    var box = await _openBox();

    var posts = _posts.map((e) => MapperBox.instanse.map<Post, HivePost>(e));

    await box.clear();

    await box.addAll(posts);

    await box.close();
  }

  Future<Box<HivePost>> _openBox() => Hive.openBox<HivePost>('post');
}
