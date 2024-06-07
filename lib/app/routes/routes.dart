import 'package:flutter/material.dart';

import '../../home/home.dart';
import '../../news/article/article.dart';
import '../../news/photo_album/photo_album.dart';
import '../../news/video/video.dart';

enum PageRouteName {
  home,
  articleDetail,
  photoAlbumDetail,
  videoDetail,
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  return PageRouteNameExt.getPage(settings: settings);
}

extension PageRouteNameExt on PageRouteName {
  String get routeLink {
    switch (this) {
      case PageRouteName.home: 
        return '/';
      case PageRouteName.articleDetail: 
        return '/article_detail';
      case PageRouteName.photoAlbumDetail: 
        return '/photo_album_detail';
      case PageRouteName.videoDetail:
        return '/video_detail';
    }        
  }

  static PageRouteName fromLink(String link) {
    for (final routeName in PageRouteName.values) {
      if (link == routeName.routeLink) {
        return routeName;
      }
    }
    throw Exception('No route defined for $link');
  }

  static Route getPage({
    required RouteSettings settings,
  }) {
    final routeName = fromLink(settings.name ?? '');
    switch (routeName) {
      case PageRouteName.home: 
        return HomePage.route();
      case PageRouteName.articleDetail:
        final args = settings.arguments as ArticleDetailArgs;
        return ArticleDetailPage.route(args: args);
      case PageRouteName.photoAlbumDetail: 
        final args = settings.arguments as PhotoAlbumDetailArgs;
        return PhotoAlbumDetailPage.route(args: args);
      case PageRouteName.videoDetail:
        final args = settings.arguments as VideoDetailArgs;
        return VideoDetailPage.route(args: args);
    }      
  }
}
