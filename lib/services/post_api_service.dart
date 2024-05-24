import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_flutter/Models/post.dart';

class PostApiService {
  Future<List<Post>> fetchPosts(int userId) async {
    final String apiUrl =
        'https://jsonplaceholder.typicode.com/posts?userId=$userId';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((post) => Post.fromJson(post)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw e;
    }
  }
}
