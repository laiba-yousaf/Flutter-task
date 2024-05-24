import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:task_flutter/Models/albumb.dart';
import 'package:task_flutter/ui/common/app_colors.dart';
import 'package:task_flutter/ui/common/ui_helpers.dart';

import 'my_albumb_viewmodel.dart';

class MyAlbumbView extends StackedView<MyAlbumbViewModel> {
  const MyAlbumbView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(MyAlbumbViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.albumsFuture = viewModel.fetchAlbum();
  }

  @override
  Widget builder(
    BuildContext context,
    MyAlbumbViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Albums',
          style: TextStyle(color: kcVeryLightGrey),
        ),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      body: FutureBuilder<List<Album>>(
        future: viewModel.albumsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('Failed to load albums.'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Album album = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      viewModel.navigationToAlbumDetail(album.id);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: kcLightGrey,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpaceSmall,
                          const Center(child: Icon(Icons.folder, size: 50.0)),
                          Text(
                            album.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  @override
  MyAlbumbViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyAlbumbViewModel();
}
