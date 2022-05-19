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

  Future<bool> deleteUser(int id) async {
    var uri = Uri.parse('${ApiConstants.baseUrl}users/$id');
    final response = await client.delete(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${SecretKeys.authToken}',
    });
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete user');
    }
  }
}
