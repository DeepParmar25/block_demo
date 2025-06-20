import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/get_users.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUsers getUsersUseCase;

  UserCubit(this.getUsersUseCase) : super(UserInitial());

  void fetchUsers() async {
    emit(UserLoading());
    try {
      final users = await getUsersUseCase();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
