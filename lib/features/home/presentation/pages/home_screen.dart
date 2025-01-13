import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/features/home/data/data_sources/user_local_data_source.dart';
import 'package:flutter_bloc_template/features/home/data/data_sources/user_remote_data_source.dart';
import 'package:flutter_bloc_template/features/home/data/repository/user_repository_impl.dart';
import 'package:flutter_bloc_template/features/home/domain/entites/user_entity.dart';
import 'package:flutter_bloc_template/features/home/domain/usecases/add_user.dart';
import 'package:flutter_bloc_template/features/home/domain/usecases/fetch_users.dart';
import 'package:flutter_bloc_template/features/home/presentation/bloc/user_bloc.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: BlocProvider<UserBloc>(create: (_)=>UserBloc(fetchUsers: FetchUsers(UserRepositoryImpl(remoteDataSource: UserRemoteDataSourceImpl('baseUrl'), localDataSource: UserLocalDataSourceImpl(Box))), addUser: AddUser(UserRepositoryImpl(localDataSource: )))),
        );
  }
}
