import 'package:go_router/go_router.dart';

import '../../features/user_list_Page/presentation/user_list_screen.dart';

final GoRouter router = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => UserListScreen())],
);
