import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:task_flutter/ui/views/home/home_view.dart';
import 'package:task_flutter/ui/views/my_albumb/my_albumb_view.dart';
import 'package:task_flutter/ui/views/my_post/my_post_view.dart';

import '../../../app/app.locator.dart';

class BottomNavigationBarViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int selectedIndex = 0;

  void updateIndex(index) {
    selectedIndex = index;
    notifyListeners();
  }

  Widget getScreen() {
    switch (selectedIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const MyAlbumbView();
      case 2:
        return const MyPostView();
      case 3:
        return const HomeView();
      default:
        return Container();
    }
  }
}
