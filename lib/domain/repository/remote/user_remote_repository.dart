import 'dart:async';

import '../../model/user.dart';

abstract class UserRemoteRepository {
  FutureOr<List<User>> getUsers();
}
