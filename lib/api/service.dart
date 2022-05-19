import 'package:http/http.dart' as http;

import 'constants.dart';
import '../models/user_model.dart';

class ApiService {
  Future<List<User>> getUsers() async {
    var client = http.Client();

    var uri = Uri.parse('${ApiConstants.baseUrl}users');
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final json = response.body;
      return userFromJson(json);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
