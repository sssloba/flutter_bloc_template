import 'package:flutter_bloc_template/features/home/data/data_sources/user_local_data_source.dart';
import 'package:flutter_bloc_template/features/home/data/data_sources/user_remote_data_source.dart';
import 'package:flutter_bloc_template/features/home/data/models/user_models.dart';
import 'package:flutter_bloc_template/features/home/domain/entites/user_entity.dart';
import 'package:flutter_bloc_template/features/home/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<UserEntity>> fetchUsers() async {
    try {
      final users = await remoteDataSource.fetchUsers();
      for (final user in users) {
        await localDataSource.addUser(user);
      }
      return users;
    } catch (_) {
      return await localDataSource.fetchUsers();
    }
  }

  @override
  Future<void> addUser(UserEntity user) async {
    final userModel =
        UserModel(id: user.id, name: user.name, email: user.email);
    await remoteDataSource.addUser(userModel);
    await localDataSource.addUser(userModel);
  }
}
