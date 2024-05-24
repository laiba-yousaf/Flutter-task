import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:task_flutter/Models/photo.dart';
import 'package:task_flutter/services/photo_api_service.dart';

import '../../../services/shared_pereference_service.dart';

class AlbumDetailViewModel extends BaseViewModel {
  final PhotoApiService _photoService = PhotoApiService();
  late Future<List<Photo>> photosFuture;
   final SharedPereferenceService _sharedPreferencesHelper =
      SharedPereferenceService();

  void fetchPhotos(int albumId) {
    photosFuture = _fetchPhotos(albumId);
  }

 Future<List<Photo>> _fetchPhotos(int albumId) async {
    try {
      setBusy(true);

      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        // No internet connection, fetch cached photos
        final cachedPhotos = await  _sharedPreferencesHelper.getCachedPhotos(albumId);
        if (cachedPhotos.isNotEmpty) {
          return cachedPhotos;
        } else {
          throw Exception("No photos available offline");
        }
      } else {
        // Internet connection available, fetch photos from API
        final photos = await _photoService.fetchPhotos(albumId);
        // Cache the photos
        await  _sharedPreferencesHelper.cachePhotos(albumId, photos);
        return photos;
      }
    } catch (e) {
      print(e);
      return []; // Return an empty list if an error occurs
    } finally {
      setBusy(false);
    }
  }
}
