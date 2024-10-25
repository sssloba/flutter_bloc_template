import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/features/home/domain/usecases/add_user.dart';
import 'package:flutter_bloc_template/features/home/domain/usecases/fetch_users.dart';
import 'package:flutter_bloc_template/features/home/presentation/bloc/user_event.dart';
import 'package:flutter_bloc_template/features/home/presentation/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FetchUsers fetchUsers;
  final AddUser addUser;

  UserBloc({required this.fetchUsers, required this.addUser})
      : super(UserInitialState()) {
    on<FetchUsersEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await fetchUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState("Failed to fetch users"));
      }
    });

    on<AddUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        await addUser(event.user);
        add(FetchUsersEvent());
      } catch (e) {
        emit(UserErrorState("Failed to add user"));
      }
    });
  }
}
