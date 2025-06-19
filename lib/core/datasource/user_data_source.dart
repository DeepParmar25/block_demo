import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> getUsers();
}

class UserDataSourceImpl implements UserDataSource {
  final http.Client client;
  UserDataSourceImpl(this.client);

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await client.get(Uri.parse('https://dummyjson.com/users'));
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      final users = List<Map<String, dynamic>>.from(jsonMap['users']);
      return users.map((u) => UserModel.fromJson(u)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
