import 'dart:convert';
import 'package:flutter_bloc_template/features/home/data/models/user_models.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<List<UserModel>> fetchUsers();
  Future<void> addUser(UserModel user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final String baseUrl;

  UserRemoteDataSourceImpl(this.baseUrl);

  @override
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List;
      return jsonData.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Future<void> addUser(UserModel user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      body: jsonEncode(user.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add user');
    }
  }
}
