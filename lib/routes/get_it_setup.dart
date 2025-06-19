import 'package:demo_block/presentation/user_list_Page/cubit/user_cubit.dart';
import 'package:demo_block/presentation/user_list_Page/domain/get_users.dart';
import 'package:demo_block/presentation/user_list_Page/domain/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../core/datasource/user_data_source.dart';
import '../core/repositories/user_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => http.Client());

  getIt.registerLazySingleton<UserDataSource>(
    () => UserDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton(() => GetUsers(getIt()));

  getIt.registerFactory(() => UserCubit(getIt()));
}
