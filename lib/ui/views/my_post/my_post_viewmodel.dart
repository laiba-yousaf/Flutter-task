import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:task_flutter/Models/post.dart';
import 'package:task_flutter/app/app.locator.dart';
import 'package:task_flutter/app/app.router.dart';
import 'package:task_flutter/services/post_api_service.dart';
import 'package:task_flutter/services/shared_pereference_service.dart';

class MyPostViewModel extends BaseViewModel {
  final PostApiService _postApiService = PostApiService();

  final SharedPereferenceService _sharedPreferencesHelper =
      SharedPereferenceService();

  late Future<List<Post>> postsFuture;
  final _navigationService = locator<NavigationService>();

  void fetchPosts(int userId) {
    postsFuture = _fetchPosts(userId);
  }

  Future<List<Post>> _fetchPosts(int userId) async {
    try {
      setBusy(true);

      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        final cachedPosts = await _sharedPreferencesHelper.getCachedPosts();
        if (cachedPosts.isNotEmpty) {
          return cachedPosts;
        } else {
          throw Exception("Not  Post available");
        }
      } else {
        final posts = await _postApiService.fetchPosts(userId);
        await _sharedPreferencesHelper.cachePosts(posts);
        return posts;
      }
    } catch (e) {
      print(e);
      return [];
    } finally {
      setBusy(false);
    }
  }

  void navigationToPostDetail(postid) {
    _navigationService.navigateToDetailPostView(postid: postid);
  }
}
