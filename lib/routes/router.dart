import 'package:demo_block/presentation/user_list_Page/screens/user_list_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => UserListScreen())],
);
