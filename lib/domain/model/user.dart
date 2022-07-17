import 'company.dart';

class User {
  final int id;

  final String username;

  final String name;

  final String email;

  final String phone;

  final String website;

  final List<Company> working;

  final String address;

  User(this.id, this.username, this.name, this.email, this.phone, this.website,
      this.working, this.address);
}
