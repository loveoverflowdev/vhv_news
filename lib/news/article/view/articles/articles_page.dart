import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';

import 'articles_list_view.dart';

class ArticlesArgs {
  final CategoryResponse category;

  ArticlesArgs({
    required this.category,
  });
}

class ArticlesPage extends StatelessWidget {
  static Route route({
    required ArticlesArgs args,
  }) => MaterialPageRoute(builder: (_) => ArticlesPage(
    args: args,
  ));

  final ArticlesArgs args;

  const ArticlesPage({super.key, required this.args,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.category.title),
      ),
      body: ArticlesListView(category: args.category),
    );
  }
}
