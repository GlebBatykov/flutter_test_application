import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/image.dart';
import '../../../../domain/repository/local/image_local_repository.dart';
import 'model/hive_image.dart';

class HiveImageRepository extends ImageLocalRepository {
  final List<Image> _images = [];

  @override
  bool get isEmpty => _images.isEmpty;

  @override
  bool get isNotEmpty => _images.isNotEmpty;

  @override
  void add(Image data) {
    _images.add(data);
  }

  @override
  void addAll(List<Image> data) {
    _images.addAll(data);
  }

  @override
  List<Image> get() => List.unmodifiable(_images);

  @override
  Future<void> load() async {
    var box = await _openBox();

    var images =
        box.values.map((e) => MapperBox.instanse.map<HiveImage, Image>(e));

    _images.clear();

    _images.addAll(images);

    await box.close();
  }

  @override
  Future<void> save() async {
    var box = await _openBox();

    var images =
        _images.map((e) => MapperBox.instanse.map<Image, HiveImage>(e));

    await box.clear();

    await box.addAll(images);

    await box.close();
  }

  Future<Box<HiveImage>> _openBox() => Hive.openBox('image');
}
