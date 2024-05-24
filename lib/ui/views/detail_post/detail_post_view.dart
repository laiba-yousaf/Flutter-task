import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:task_flutter/Models/comment.dart';
import 'package:task_flutter/ui/common/app_colors.dart';

import 'detail_post_viewmodel.dart';

class DetailPostView extends StackedView<DetailPostViewModel> {
  final postid;
  const DetailPostView({Key? key, required this.postid}) : super(key: key);

  @override
  void onViewModelReady(DetailPostViewModel viewModel) {
  
    super.onViewModelReady(viewModel);
    viewModel.fetchComments(postid);
  }

  @override
  Widget builder(
    BuildContext context,
    DetailPostViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        backgroundColor: kcPrimaryColor,
      ),
      body: FutureBuilder<List<Comment>>(
        future: viewModel.commentsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load comments.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No comments found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Comment comment = snapshot.data![index];
                return ListTile(
                  title: Text(comment.name),
                  subtitle: Text(comment.body),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  DetailPostViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetailPostViewModel();
}
