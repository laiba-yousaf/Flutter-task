import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:task_flutter/Models/photo.dart';
import 'package:task_flutter/ui/common/app_colors.dart';

import 'album_detail_viewmodel.dart';

class AlbumDetailView extends StackedView<AlbumDetailViewModel> {
  final int albumId;
  const AlbumDetailView({Key? key, required this.albumId}) : super(key: key);

  @override
  void onViewModelReady(AlbumDetailViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.fetchPhotos(albumId);
  }

  @override
  Widget builder(
    BuildContext context,
    AlbumDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Details'),
        backgroundColor: kcPrimaryColor,
      ),
      body: FutureBuilder<List<Photo>>(
        future: viewModel.photosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load photos.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No photos found.'));
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
                  Photo photo = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(photo.thumbnailUrl,
                              height: 100, width: 100, fit: BoxFit.cover),
                          const SizedBox(height: 10.0),
                          Text(
                            photo.title,
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
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
  AlbumDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AlbumDetailViewModel();
}
