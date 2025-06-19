import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_cubit.dart';
import '../states/user_state.dart';

class UserListScreen extends StatelessWidget {
  Future<void> _refresh(BuildContext context) {
    context.read<UserCubit>().fetchUsers();
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo User List')),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else if (state is UserLoaded) {
            return RefreshIndicator(
              onRefresh: () => _refresh(context),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.users.length,
                itemBuilder: (_, i) {
                  final user = state.users[i];
                  return ListTile(
                    leading: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: user.image,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(strokeWidth: 2),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),

                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(
                      '${user.department} AT \'${user.companyName}\'',
                    ),
                  );
                },
              ),
            );
          } else if (state is UserError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
