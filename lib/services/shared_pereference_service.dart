import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_flutter/Models/UserData.dart';
import 'package:task_flutter/Models/albumb.dart';
import 'package:task_flutter/Models/photo.dart';
import 'package:task_flutter/Models/post.dart';
import 'package:task_flutter/Models/comment.dart';

class SharedPereferenceService {
  static const String postsKey = 'cached_posts';
  static const String commentsKey = 'cached_comments';

  Future<void> cachePosts(List<Post> posts) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jsonString =
        jsonEncode(posts.map((post) => post.toJson()).toList());
    prefs.setString(postsKey, jsonString);
  }

  Future<void> cacheComments(int postId, List<Comment> comments) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jsonString =
        jsonEncode(comments.map((comment) => comment.toJson()).toList());
    prefs.setString('$commentsKey$postId', jsonString);
  }

  Future<List<Post>> getCachedPosts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(postsKey);
    if (jsonString != null) {
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return jsonData.map((post) => Post.fromJson(post)).toList();
    }
    return [];
  }

  Future<List<Comment>> getCachedComments(int postId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('$commentsKey$postId');
    if (jsonString != null) {
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return jsonData.map((comment) => Comment.fromJson(comment)).toList();
    }
    return [];
  }

  static const String albumsKey = 'cached_albums';

  Future<void> cacheAlbums(List<Album> albums) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jsonString =
        jsonEncode(albums.map((album) => album.toJson()).toList());
    prefs.setString(albumsKey, jsonString);
  }

  Future<List<Album>> getCachedAlbums() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(albumsKey);
    if (jsonString != null) {
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return jsonData.map((album) => Album.fromJson(album)).toList();
    }
    return [];
  }

  Future<void> cachePhotos(int albumId, List<Photo> photos) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String photosJson =
        jsonEncode(photos.map((photo) => photo.toJson()).toList());
    await prefs.setString('cachedPhotos_$albumId', photosJson);
  }

  Future<List<Photo>> getCachedPhotos(int albumId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? photosJson = prefs.getString('cachedPhotos_$albumId');
    if (photosJson != null) {
      List<dynamic> photosList = jsonDecode(photosJson);
      return photosList.map((json) => Photo.fromJson(json)).toList();
    } else {
      return [];
    }
  }



   Future<void> cacheUserProfile(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString('cachedUserProfile', userJson);
  }

  Future<User?> getCachedUserProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('cachedUserProfile');
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    } else {
      return null;
    }
  }
}
