import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:task_flutter/Models/albumb.dart';
import 'package:task_flutter/app/app.locator.dart';
import 'package:task_flutter/app/app.router.dart';
import 'package:task_flutter/services/album_service.dart';
import 'package:task_flutter/services/shared_pereference_service.dart';

class MyAlbumbViewModel extends BaseViewModel {
  final AlbumService _albumService = AlbumService();
  final _navigationService = locator<NavigationService>();
  final SharedPereferenceService _sharedPreferencesHelper =
      SharedPereferenceService();

  late Future<List<Album>> albumsFuture;

  List<Album>? _album;
  bool _isLoading = false;

  List<Album>? get album => _album;
  bool get isLoading => _isLoading;

  Future<List<Album>> fetchAlbum() async {
    try {
      _isLoading = true;
      notifyListeners();
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        _album = await _sharedPreferencesHelper.getCachedAlbums();
      } else {
        _album = await _albumService.fetchAlbums(1);
        if (_album != null && _album!.isNotEmpty) {
          _sharedPreferencesHelper.cacheAlbums(_album!);
        }
      }

      return _album ?? []; // Return the fetched albums or an empty list if null
    } catch (e) {
      print(e);
      return []; // Return an empty list if an error occurs
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void navigationToAlbumDetail(albumid) {
    _navigationService.navigateToAlbumDetailView(albumId: albumid);
  }
}
