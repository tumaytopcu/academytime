import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String? email;

  @HiveField(1)
  String? password;

  @HiveField(2)
  String? firstName;

  @HiveField(3)
  String? lastName;

  @HiveField(4)
  String? program;

  String? getName() {
    return firstName! + " " + lastName!;
  }

  String? getEmail() {
    return email;
  }

  User({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.program,
  });
}
