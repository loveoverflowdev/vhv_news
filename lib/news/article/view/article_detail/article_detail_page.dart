import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import 'article_detail_view.dart';

class ArticleDetailArgs {
  final String articleId;

  ArticleDetailArgs({
    required this.articleId,
  });
}

class ArticleDetailPage extends StatefulWidget {
  final ArticleDetailArgs args;

  const ArticleDetailPage({super.key, required this.args});

  static Route route({
    required ArticleDetailArgs args,
  }) =>
      MaterialPageRoute(
        builder: (_) => ArticleDetailPage(args: args),
      );

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late final ArticleDetailController _articleDetailController;

  @override
  void initState() {
    super.initState();
    _articleDetailController = ArticleDetailController(articleRepository: Get.find())
      ..loadArticleDetail(widget.args.articleId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final articleDetail = _articleDetailController.articleDetail.value;
        final rewriteUrl = articleDetail?.rewriteUrl;
        final articleTitle = articleDetail?.title;

        return Scaffold(
          appBar: AppBar(
            title: Text(articleTitle ?? ''),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            leading: AppBackButton(
              onPressed: Navigator.of(context).pop,
            ),
            actions: [
              if (rewriteUrl?.isNotEmpty == true)
                Padding(
                  key: const Key('articlePage_shareButton'),
                  padding: const EdgeInsets.only(right: AppSpacing.lg),
                  child: ShareButton(
                    shareText: 'Chia sẻ',
                    color: AppColors.highEmphasisSurface,
                    onPressed: () {
                      _articleDetailController.shareArticle(url: rewriteUrl ?? '');
                    },
                  ),
                ),
            ],
          ),
          body: ArticleDetailView(
            article: articleDetail,
          ),
        );
      },
    );
  }
}
