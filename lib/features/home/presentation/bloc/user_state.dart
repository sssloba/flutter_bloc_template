import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_template/features/home/domain/entites/user_entity.dart';

sealed class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<UserEntity> users;
  UserLoadedState(this.users);

  @override
  List<Object> get props => [users];
}

class UserErrorState extends UserState {
  final String message;
  UserErrorState(this.message);

  @override
  List<Object> get props => [message];
}
