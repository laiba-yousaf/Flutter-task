// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i10;
import 'package:task_flutter/ui/views/album_detail/album_detail_view.dart'
    as _i6;
import 'package:task_flutter/ui/views/bottom_navigation_bar/bottom_navigation_bar_view.dart'
    as _i4;
import 'package:task_flutter/ui/views/detail_post/detail_post_view.dart' as _i8;
import 'package:task_flutter/ui/views/home/home_view.dart' as _i2;
import 'package:task_flutter/ui/views/my_albumb/my_albumb_view.dart' as _i5;
import 'package:task_flutter/ui/views/my_post/my_post_view.dart' as _i7;
import 'package:task_flutter/ui/views/startup/startup_view.dart' as _i3;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const bottomNavigationBarView = '/bottom-navigation-bar-view';

  static const myAlbumbView = '/my-albumb-view';

  static const albumDetailView = '/album-detail-view';

  static const myPostView = '/my-post-view';

  static const detailPostView = '/detail-post-view';

  static const all = <String>{
    homeView,
    startupView,
    bottomNavigationBarView,
    myAlbumbView,
    albumDetailView,
    myPostView,
    detailPostView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.bottomNavigationBarView,
      page: _i4.BottomNavigationBarView,
    ),
    _i1.RouteDef(
      Routes.myAlbumbView,
      page: _i5.MyAlbumbView,
    ),
    _i1.RouteDef(
      Routes.albumDetailView,
      page: _i6.AlbumDetailView,
    ),
    _i1.RouteDef(
      Routes.myPostView,
      page: _i7.MyPostView,
    ),
    _i1.RouteDef(
      Routes.detailPostView,
      page: _i8.DetailPostView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.BottomNavigationBarView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.BottomNavigationBarView(),
        settings: data,
      );
    },
    _i5.MyAlbumbView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.MyAlbumbView(),
        settings: data,
      );
    },
    _i6.AlbumDetailView: (data) {
      final args = data.getArgs<AlbumDetailViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.AlbumDetailView(key: args.key, albumId: args.albumId),
        settings: data,
      );
    },
    _i7.MyPostView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.MyPostView(),
        settings: data,
      );
    },
    _i8.DetailPostView: (data) {
      final args = data.getArgs<DetailPostViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.DetailPostView(key: args.key, postid: args.postid),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AlbumDetailViewArguments {
  const AlbumDetailViewArguments({
    this.key,
    required this.albumId,
  });

  final _i9.Key? key;

  final int albumId;

  @override
  String toString() {
    return '{"key": "$key", "albumId": "$albumId"}';
  }

  @override
  bool operator ==(covariant AlbumDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.albumId == albumId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ albumId.hashCode;
  }
}

class DetailPostViewArguments {
  const DetailPostViewArguments({
    this.key,
    required this.postid,
  });

  final _i9.Key? key;

  final dynamic postid;

  @override
  String toString() {
    return '{"key": "$key", "postid": "$postid"}';
  }

  @override
  bool operator ==(covariant DetailPostViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.postid == postid;
  }

  @override
  int get hashCode {
    return key.hashCode ^ postid.hashCode;
  }
}

extension NavigatorStateExtension on _i10.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomNavigationBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bottomNavigationBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyAlbumbView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myAlbumbView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAlbumDetailView({
    _i9.Key? key,
    required int albumId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.albumDetailView,
        arguments: AlbumDetailViewArguments(key: key, albumId: albumId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyPostView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myPostView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailPostView({
    _i9.Key? key,
    required dynamic postid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.detailPostView,
        arguments: DetailPostViewArguments(key: key, postid: postid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomNavigationBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bottomNavigationBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyAlbumbView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myAlbumbView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAlbumDetailView({
    _i9.Key? key,
    required int albumId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.albumDetailView,
        arguments: AlbumDetailViewArguments(key: key, albumId: albumId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyPostView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myPostView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDetailPostView({
    _i9.Key? key,
    required dynamic postid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.detailPostView,
        arguments: DetailPostViewArguments(key: key, postid: postid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
