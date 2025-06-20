import 'package:demo_block/features/user_list_Page/application/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/get_it_setup.dart' as getIt;
import 'config/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getIt.setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.getIt<UserCubit>()..fetchUsers(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Demo User List',
        routerConfig: router,
      ),
    );
  }
}
