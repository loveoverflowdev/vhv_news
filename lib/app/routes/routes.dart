import 'package:flutter/material.dart';
import 'package:vhv_news/news/song/view/song_detail_page.dart';

import '../../home/home.dart';
import '../../news/article/article.dart';
import '../../news/emagazine/emagazine.dart';
import '../../news/photo_album/photo_album.dart';
import '../../news/video/video.dart';

enum PageRouteName {
  home,
  articles,
  articleDetail,
  photoAlbumDetail,
  videoDetail,
  emagazineDetail,
  songDetail,
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
      case PageRouteName.articles:
        return '/articles';
      case PageRouteName.emagazineDetail:
        return '/emagazine_detail';
      case PageRouteName.songDetail:
        return '/song_detail';
    }        
  }

  static PageRouteName _fromLink(String link) {
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
    final routeName = _fromLink(settings.name ?? '');
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
      case PageRouteName.articles:
        final args = settings.arguments as ArticlesArgs;
        return ArticlesPage.route(args: args);
      case PageRouteName.emagazineDetail:
        final args = settings.arguments as EmagazineDetailArgs;
        return EmagazineDetailPage.route(args: args);
      case PageRouteName.songDetail:
        final args = settings.arguments as SongDetailArgs;
        return SongDetailPage.route(args: args);
    }      
  }
}
