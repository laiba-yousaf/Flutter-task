import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:task_flutter/Models/post.dart';
import 'package:task_flutter/ui/common/app_colors.dart';

import 'my_post_viewmodel.dart';

class MyPostView extends StackedView<MyPostViewModel> {
  const MyPostView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(MyPostViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.fetchPosts(1);
  }

  @override
  Widget builder(
    BuildContext context,
    MyPostViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posts',
          style: TextStyle(color: kcVeryLightGrey),
        ),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      body: FutureBuilder<List<Post>>(
        future: viewModel.postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load posts.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No posts found.'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Post post = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    viewModel.navigationToPostDetail(post.id);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            post.body,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  MyPostViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyPostViewModel();
}
