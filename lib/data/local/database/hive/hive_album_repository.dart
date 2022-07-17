import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/album.dart';
import '../../../../domain/repository/local/album_local_repository.dart';
import 'model/hive_album.dart';

class HiveAlbumRepository extends AlbumLocalRepository {
  final List<Album> _albums = [];

  @override
  bool get isEmpty => _albums.isEmpty;

  @override
  bool get isNotEmpty => _albums.isNotEmpty;

  @override
  void add(Album data) {
    _albums.add(data);
  }

  @override
  void addAll(List<Album> data) {
    _albums.addAll(data);
  }

  @override
  List<Album> get() => List.unmodifiable(_albums);

  @override
  Future<void> load() async {
    var box = await _openBox();

    var albums =
        box.values.map((e) => MapperBox.instanse.map<HiveAlbum, Album>(e));

    _albums.clear();

    _albums.addAll(albums);

    await box.close();
  }

  @override
  Future<void> save() async {
    var box = await _openBox();

    var albums =
        _albums.map((e) => MapperBox.instanse.map<Album, HiveAlbum>(e));

    await box.clear();

    await box.addAll(albums);

    await box.close();
  }

  Future<Box<HiveAlbum>> _openBox() => Hive.openBox('album');
}
