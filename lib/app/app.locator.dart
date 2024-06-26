// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/album_detail_service.dart';
import '../services/album_service.dart';
import '../services/comment_api_service.dart';
import '../services/photo_api_service.dart';
import '../services/post_api_service.dart';
import '../services/profile_service.dart';
import '../services/shared_pereference_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ProfileService());
  locator.registerLazySingleton(() => AlbumService());
  locator.registerLazySingleton(() => PhotoApiService());
  locator.registerLazySingleton(() => AlbumDetailService());
  locator.registerLazySingleton(() => PostApiService());
  locator.registerLazySingleton(() => CommentApiService());
  locator.registerLazySingleton(() => SharedPereferenceService());
}
