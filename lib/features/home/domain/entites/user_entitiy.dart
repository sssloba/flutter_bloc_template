import 'package:equatable/equatable.dart';

class UserEntitiy extends Equatable {
  final String id;
  final String name;
  final String email;

  const UserEntitiy(
      {required this.id, required this.name, required this.email});

  @override
  List<Object> get props => [id, name, email];
}
