import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_template/features/home/domain/entites/user_entity.dart';

sealed class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchUsersEvent extends UserEvent {}

class AddUserEvent extends UserEvent {
  final UserEntity user;
  AddUserEvent(this.user);

  @override
  List<Object> get props => [user];
}
