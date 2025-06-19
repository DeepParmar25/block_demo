import '../../presentation/user_list_Page/domain/user.dart';
import '../../presentation/user_list_Page/domain/user_repository.dart';
import '../datasource/user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource remoteDataSource;
  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<User>> getUsers() async {
    return await remoteDataSource.getUsers();
  }
}
