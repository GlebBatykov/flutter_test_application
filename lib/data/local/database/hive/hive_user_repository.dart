import 'dart:async';

import 'package:hive_flutter/adapters.dart';
import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/user.dart';
import '../../../../domain/repository/local/user_local_repository.dart';
import 'model/hive_user.dart';

class HiveUserRepository extends UserLocalRepository {
  final List<User> _users = [];

  @override
  bool get isEmpty => _users.isEmpty;

  @override
  bool get isNotEmpty => _users.isNotEmpty;

  @override
  void add(User data) {
    _users.add(data);
  }

  @override
  void addAll(List<User> data) {
    _users.addAll(data);
  }

  @override
  List<User> get() => List.unmodifiable(_users);

  @override
  Future<void> load() async {
    var box = await _openBox();

    var users =
        box.values.map((e) => MapperBox.instanse.map<HiveUser, User>(e));

    _users.clear();

    _users.addAll(users);

    await box.close();
  }

  @override
  Future<void> save() async {
    var box = await _openBox();

    var users = _users.map((e) => MapperBox.instanse.map<User, HiveUser>(e));

    await box.clear();

    await box.addAll(users);

    await box.close();
  }

  Future<Box<HiveUser>> _openBox() => Hive.openBox<HiveUser>('user');
}
