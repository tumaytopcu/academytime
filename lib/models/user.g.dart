// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    return User(
      email: (reader.read() as String?) ?? '',
      password: (reader.read() as String?) ?? '',
      firstName: (reader.read() as String?) ?? '',
      lastName: (reader.read() as String?) ?? '',
      program: (reader.read() as String?) ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.email);
    writer.write(obj.password);
    writer.write(obj.firstName);
    writer.write(obj.lastName);
    writer.write(obj.program);
  }
}
