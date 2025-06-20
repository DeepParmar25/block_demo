import '../../features/user_list_Page/data/get_user_list.dart';
import '../../features/user_list_Page/domain/user.dart';
import '../../features/user_list_Page/domain/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource remoteDataSource;
  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<User>> getUsers() async {
    return await remoteDataSource.getUsers();
  }
}
