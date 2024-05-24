import 'dart:convert';
import 'package:task_flutter/Models/albumb.dart';
import 'package:http/http.dart' as http;

class AlbumService {
  Future<List<Album>> fetchAlbums(int userId) async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/albums?userId=$userId'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }
}
