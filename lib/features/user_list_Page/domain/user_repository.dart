import 'package:demo_block/features/user_list_Page/domain/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
