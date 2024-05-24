import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:task_flutter/Models/comment.dart';
import 'package:task_flutter/services/comment_api_service.dart';
import 'package:task_flutter/services/shared_pereference_service.dart';

class DetailPostViewModel extends BaseViewModel {
  final CommentApiService _commentApiService = CommentApiService();
  final SharedPereferenceService _sharedPreferencesHelper =
      SharedPereferenceService();

  late Future<List<Comment>> commentsFuture;

  void fetchComments(int postId) {
    commentsFuture = _fetchComments(postId);
  }

  Future<List<Comment>> _fetchComments(int postId) async {
    try {
      setBusy(true);

      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        final cachedComments =
            await _sharedPreferencesHelper.getCachedComments(postId);
        if (cachedComments.isNotEmpty) {
          return cachedComments;
        } else {
          throw Exception("No comment are available");
        }
      } else {
        final comments = await _commentApiService.fetchComments(postId);
        await _sharedPreferencesHelper.cacheComments(postId, comments);
        return comments;
      }
    } catch (e) {
      return [];
    } finally {
      setBusy(false);
    }
  }
}
