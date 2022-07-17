part of 'user_page_cubit.dart';

@immutable
abstract class UserPageState {}

class UserPageInitial extends UserPageState {}

class UserPageShow extends UserPageState {
  final String username;

  final String name;

  final String email;

  final String phone;

  final String website;

  final List<Company> companys;

  final String address;

  final UserPageAlbumsCubit albumsCubit;

  final UserPagePostsCubit postsCubit;

  UserPageShow(this.username, this.name, this.email, this.phone, this.website,
      this.companys, this.address, this.albumsCubit, this.postsCubit);
}
