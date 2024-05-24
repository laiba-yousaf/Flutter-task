import 'package:task_flutter/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:task_flutter/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:task_flutter/ui/views/home/home_view.dart';
import 'package:task_flutter/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:task_flutter/ui/views/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:task_flutter/services/profile_service.dart';
import 'package:task_flutter/services/album_service.dart';
import 'package:task_flutter/ui/views/my_albumb/my_albumb_view.dart';
import 'package:task_flutter/services/photo_api_service.dart';
import 'package:task_flutter/services/album_detail_service.dart';
import 'package:task_flutter/ui/views/album_detail/album_detail_view.dart';
import 'package:task_flutter/ui/views/my_post/my_post_view.dart';
import 'package:task_flutter/services/post_api_service.dart';
import 'package:task_flutter/ui/views/detail_post/detail_post_view.dart';
import 'package:task_flutter/services/comment_api_service.dart';
import 'package:task_flutter/services/shared_pereference_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: BottomNavigationBarView),
    MaterialRoute(page: MyAlbumbView),
    MaterialRoute(page: AlbumDetailView),
    MaterialRoute(page: MyPostView),
    MaterialRoute(page: DetailPostView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ProfileService),
    LazySingleton(classType: AlbumService),
    LazySingleton(classType: PhotoApiService),
    LazySingleton(classType: AlbumDetailService),
    LazySingleton(classType: PostApiService),
    LazySingleton(classType: CommentApiService),
    LazySingleton(classType: SharedPereferenceService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
