import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter/Models/UserData.dart';
import 'package:task_flutter/app/app.locator.dart';
import 'package:task_flutter/services/profile_service.dart';
import 'package:stacked/stacked.dart';
import 'package:task_flutter/services/shared_pereference_service.dart';
import 'package:task_flutter/ui/common/app_colors.dart';

class HomeViewModel extends BaseViewModel {
  final _profileService = locator<ProfileService>();
  final SharedPereferenceService _sharedPreferencesHelper =
      SharedPereferenceService();

  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

 Future<void> fetchUser() async {
  
    _isLoading = true;
    notifyListeners();

    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.none) {

        _user = await _sharedPreferencesHelper.getCachedUserProfile();
        if (_user == null) {
          throw Exception("No user profile available offline");
        }
      } else {
        _user = await _profileService.fetchUserProfile();     
        await _sharedPreferencesHelper.cacheUserProfile(_user!);
      }
    }catch (e) {

      print(e);

    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Widget buildDetailTile(String label, String value) {
    return ListTile(
      tileColor: kcCardColor,
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
