import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_flutter/Models/comment.dart';

class CommentApiService {
  Future<List<Comment>> fetchComments(int postId) async {
    final String apiUrl =
        'https://jsonplaceholder.typicode.com/comments?postId=$postId';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((comment) => Comment.fromJson(comment)).toList();
      } else {
        throw Exception('Failed to load comments');
      }
    } catch (e) {
      throw e;
    }
  }
}
