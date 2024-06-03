export 'articles_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import 'articles_view.dart';

class ArticlesArgs {

}

class ArticlesPage extends StatelessWidget {
  final ArticlesArgs args;

  const ArticlesPage({super.key, required this.args,});

  static Route route({
    required ArticlesArgs args,
  }) => MaterialPageRoute(
    builder: (_) => ArticlesPage(args: args),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticlesController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Các bài viết'),
          ),
          body: const ArticlesView(),
        );
      }
    );
  }
}
