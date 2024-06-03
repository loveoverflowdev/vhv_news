import 'package:flutter/material.dart';
import 'package:vhv_news/news/article.dart';

import '../../home/home.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/': 
      return HomePage.route();
    case '/detail':
      final args = settings.arguments as ArticleArgs;
      return ArticlePage.route(args: args);
    //
    default:
      return MaterialPageRoute(builder: (_) {
        return Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
      });
  }
}
