import 'dart:convert';

import 'package:http/http.dart' as http;

import 'secret_keys.dart';
import 'constants.dart';
import '../models/user_model.dart';

class ApiService {
  var client = http.Client();

  Future<List<User>> getUsers() async {
    var uri = Uri.parse('${ApiConstants.baseUrl}users');
    final response = await client.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${SecretKeys.authToken}',
    });

    if (response.statusCode == 200) {
      final json = response.body;
      return userFromJson(json);
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<Map> getUser(int id) async {
    var uri = Uri.parse('${ApiConstants.baseUrl}users/$id');
    final response = await client.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${SecretKeys.authToken}',
    });

    print(response.body);
    if (response.statusCode == 200) {
      final json = response.body;
      return jsonDecode(json);
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<void> addUser(User user) async {
    var uri = Uri.parse('${ApiConstants.baseUrl}users');
    try {
      final response = await client.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${SecretKeys.authToken}',
          },
          body: jsonEncode({
            'name': user.name,
            'email': user.email,
            'status': statusValues.reverse[user.status],
            'gender': genderValues.reverse[user.gender],
          }));

      if (response.statusCode == 201) {
        final json = response.body;
        print('****************SUCCESS****************');
        return jsonDecode(json);
      }
    } catch (e) {
      print('**********************$e**********************');
    }
  }

  Future<bool> deleteUser(int id) async {
    try {
      var uri = Uri.parse('${ApiConstants.baseUrl}users/$id');
      final response = await client.delete(uri, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SecretKeys.authToken}',
      });
      print(response.body);

      return true;
    } catch (e) {
      print('**********************$e**********************');
      return false;
    }
  }
}
