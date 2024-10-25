import 'package:flutter_bloc_template/features/home/domain/entites/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> fetchUsers();
  Future<void> addUser(UserEntity user);
}
