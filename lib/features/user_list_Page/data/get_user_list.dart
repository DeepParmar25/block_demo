import 'package:dio/dio.dart';

import '../../../core/network/dio_client.dart';
import '../domain/model/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> getUsers();
}

class GetUserList implements UserDataSource {
  final Dio _dio;

  GetUserList() : _dio = DioClient().dio;

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _dio.get('/users');
      final users = List<Map<String, dynamic>>.from(response.data['users']);
      return users.map((u) => UserModel.fromJson(u)).toList();
    } catch (e) {
      throw Exception('Failed to load user list: $e');
    }
  }
}
