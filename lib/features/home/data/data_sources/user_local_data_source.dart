import 'package:flutter_bloc_template/features/home/data/models/user_models.dart';
import 'package:hive/hive.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> fetchUsers();
  Future<void> addUser(UserModel user);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Box userBox;

  UserLocalDataSourceImpl(this.userBox);

  @override
  Future<List<UserModel>> fetchUsers() async {
    return userBox.values.cast<UserModel>().toList();
  }

  @override
  Future<void> addUser(UserModel user) async {
    await userBox.put(user.id, user);
  }
}
