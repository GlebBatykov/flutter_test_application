import 'package:get_it/get_it.dart';

import '../model/user.dart';
import '../repository/local/user_local_repository.dart';
import '../repository/remote/user_remote_repository.dart';

class GetUsersUserCase {
  Future<List<User>> getUsers() async {
    var users = <User>[];

    var userLocalRepository =
        await GetIt.instance.getAsync<UserLocalRepository>();

    if (userLocalRepository.isNotEmpty) {
      users.addAll(userLocalRepository.get());
    } else {
      var userRemoteRepository = GetIt.instance<UserRemoteRepository>();

      var remoteUsers = await userRemoteRepository.getUsers();

      users.addAll(remoteUsers);

      userLocalRepository.addAll(remoteUsers);

      await userLocalRepository.save();
    }

    return users;
  }
}
