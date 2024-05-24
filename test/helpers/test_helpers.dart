import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_flutter/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:task_flutter/services/profile_service.dart';
import 'package:task_flutter/services/album_service.dart';
import 'package:task_flutter/services/photo_api_service.dart';
import 'package:task_flutter/services/album_detail_service.dart';
import 'package:task_flutter/services/post_api_service.dart';
import 'package:task_flutter/services/comment_api_service.dart';
import 'package:task_flutter/services/shared_pereference_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ProfileService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AlbumServiceService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PhotoApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AlbumDetailService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PostApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CommentApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SharedPereferenceService>(
      onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterProfileService();
  getAndRegisterAlbumServiceService();
  getAndRegisterPhotoApiService();
  getAndRegisterAlbumDetailService();
  getAndRegisterPostApiService();
  getAndRegisterCommentApiService();
  getAndRegisterSharedPereferenceService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockProfileService getAndRegisterProfileService() {
  _removeRegistrationIfExists<ProfileService>();
  final service = MockProfileService();
  locator.registerSingleton<ProfileService>(service);
  return service;
}

MockAlbumServiceService getAndRegisterAlbumServiceService() {
  _removeRegistrationIfExists<AlbumServiceService>();
  final service = MockAlbumServiceService();
  locator.registerSingleton<AlbumServiceService>(service);
  return service;
}

MockPhotoApiService getAndRegisterPhotoApiService() {
  _removeRegistrationIfExists<PhotoApiService>();
  final service = MockPhotoApiService();
  locator.registerSingleton<PhotoApiService>(service);
  return service;
}

MockAlbumDetailService getAndRegisterAlbumDetailService() {
  _removeRegistrationIfExists<AlbumDetailService>();
  final service = MockAlbumDetailService();
  locator.registerSingleton<AlbumDetailService>(service);
  return service;
}

MockPostApiService getAndRegisterPostApiService() {
  _removeRegistrationIfExists<PostApiService>();
  final service = MockPostApiService();
  locator.registerSingleton<PostApiService>(service);
  return service;
}

MockCommentApiService getAndRegisterCommentApiService() {
  _removeRegistrationIfExists<CommentApiService>();
  final service = MockCommentApiService();
  locator.registerSingleton<CommentApiService>(service);
  return service;
}

MockSharedPereferenceService getAndRegisterSharedPereferenceService() {
  _removeRegistrationIfExists<SharedPereferenceService>();
  final service = MockSharedPereferenceService();
  locator.registerSingleton<SharedPereferenceService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
