import 'package:demo_block/features/user_list_Page/application/user_cubit.dart';
import 'package:demo_block/features/user_list_Page/data/get_user_list.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  _registerDataSources();
  // _registerRepositories();
  _registerCubits();
}

void _registerDataSources() {
  getIt.registerLazySingleton<UserDataSource>(() => GetUserList());
}

// void _registerRepositories() {
//   getIt.registerLazySingleton<UserRepository>(
//     () => UserRepositoryImpl(getIt()),
//   );
// }

void _registerCubits() {
  getIt.registerFactory(() => UserCubit(getIt()));
}
