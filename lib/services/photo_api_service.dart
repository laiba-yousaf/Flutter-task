import 'dart:convert';

import 'package:task_flutter/Models/photo.dart';
import 'package:http/http.dart' as http;

class PhotoApiService {
  Future<List<Photo>> fetchPhotos(int albumId) async {
    // Define the URL for the photos API
    final String apiUrl =
        'https://jsonplaceholder.typicode.com/photos?albumId=$albumId';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((photoData) => Photo.fromJson(photoData)).toList();
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      throw e;
    }
  }
}
