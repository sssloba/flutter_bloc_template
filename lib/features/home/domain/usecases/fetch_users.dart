import 'package:flutter_bloc_template/features/home/domain/entites/user_entity.dart';
import 'package:flutter_bloc_template/features/home/domain/repositories/user_repository.dart';

class FetchUsers {
  final UserRepository repository;

  FetchUsers(this.repository);

  Future<List<UserEntity>> call() async {
    return await repository.fetchUsers();
  }
}
