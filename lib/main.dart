import 'package:demo_block/presentation/user_list_Page/cubit/user_cubit.dart';
import 'package:demo_block/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes/get_it_setup.dart' as getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getIt.init();
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
