import 'package:demo_block/features/user_list_Page/domain/user.dart';
import 'package:demo_block/features/user_list_Page/domain/user_repository.dart';

class GetUsers {
  final UserRepository repository;
  GetUsers(this.repository);

  Future<List<User>> call() async {
    return await repository.getUsers();
  }
}
