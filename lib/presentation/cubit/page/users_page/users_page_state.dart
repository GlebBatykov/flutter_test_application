part of 'users_page_cubit.dart';

@immutable
abstract class UsersPageState {}

class UsersPageInitial extends UsersPageState {}

class UsersPageLoad extends UsersPageState {}

class UsersPageNoUsers extends UsersPageState {}

class UsersPageShowUsers extends UsersPageState {
  final List<UserCardData> data;

  UsersPageShowUsers(this.data);
}
