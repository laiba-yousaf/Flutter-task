import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import 'bottom_navigation_bar_viewmodel.dart';

class BottomNavigationBarView
    extends StackedView<BottomNavigationBarViewModel> {
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BottomNavigationBarViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: viewModel.getScreen(),
      bottomNavigationBar: SizedBox(
        height: 60,
        //  padding: EdgeInsets.symmetric(horizontal: 16),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kccardColor,
          elevation: 5,
          currentIndex: viewModel.selectedIndex,
          onTap: (index) {
            viewModel.updateIndex(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.album),
              label: "Album",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.post_add),
              label: "Post",
            ),
          ],
          selectedItemColor: kcPrimaryColor,
          unselectedItemColor: kcLightGrey,
        ),
      ),
    );
  }

  @override
  BottomNavigationBarViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BottomNavigationBarViewModel();
}
