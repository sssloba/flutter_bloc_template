import 'package:flutter_bloc_template/features/home/domain/entites/user_entity.dart';
import 'package:flutter_bloc_template/features/home/domain/repositories/user_repository.dart';

class AddUser {
  final UserRepository repository;

  AddUser(this.repository);

  Future<void> call(UserEntity user) async {
    return await repository.addUser(user);
  }
}
