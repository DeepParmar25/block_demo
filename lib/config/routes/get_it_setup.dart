import 'package:demo_block/features/user_list_Page/application/user_cubit.dart';
import 'package:demo_block/features/user_list_Page/domain/get_users.dart';
import 'package:demo_block/features/user_list_Page/domain/user_repository.dart';
import 'package:get_it/get_it.dart';

import '../../core/repositories/user_repository_impl.dart';
import '../../features/user_list_Page/data/get_user_list.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await init();
}

Future<void> init() async {
  getIt.registerLazySingleton<UserDataSource>(() => GetUserList());

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton(() => GetUsers(getIt()));

  getIt.registerFactory(() => UserCubit(getIt()));
}
