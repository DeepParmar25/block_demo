import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/get_user_list.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserDataSource dataSource;

  UserCubit(this.dataSource) : super(UserInitial());

  void fetchUsers() async {
    emit(UserLoading());
    try {
      final users = await dataSource.getUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
