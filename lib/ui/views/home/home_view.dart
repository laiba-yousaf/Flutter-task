import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:task_flutter/ui/common/app_colors.dart';
import 'package:task_flutter/ui/common/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.fetchUser();
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums & Posts App'),
        backgroundColor: kcPrimaryColor,
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewModel.user == null
              ? const Center(child: Text('Failed to load user data'))
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: CircleAvatar(
                          radius: 40,
                          child: Icon(Icons.person),
                        ),
                      ),
                      verticalSpaceMedium,
                      Expanded(
                        child: ListView(
                          children: [
                            viewModel.buildDetailTile(
                                'Name', viewModel.user!.name),
                            verticalSpaceSmall,
                            viewModel.buildDetailTile(
                                'Username', viewModel.user!.username),
                            verticalSpaceSmall,
                            viewModel.buildDetailTile(
                                'Email', viewModel.user!.email),
                            verticalSpaceSmall,
                            viewModel.buildDetailTile('Address',
                                '${viewModel.user!.address.street}, ${viewModel.user!.address.suite}, ${viewModel.user!.address.city}, ${viewModel.user!.address.zipcode}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
