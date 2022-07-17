import 'dart:async';

abstract class LocalRepository<T> {
  bool get isEmpty;

  bool get isNotEmpty;

  List<T> get();

  void add(T data);

  void addAll(List<T> data);

  FutureOr<void> load();

  FutureOr<void> save();
}
