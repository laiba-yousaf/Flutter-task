import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_flutter/Models/UserData.dart';

class ProfileService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<User> fetchUserProfile() async {
    final response = await http.get(Uri.parse('$baseUrl/users?id=1'));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body)[0]);
    } else {
      throw Exception('Failed to load user profile');
    }
  }
}
