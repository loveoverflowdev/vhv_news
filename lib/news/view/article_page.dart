
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vhv_news/news/article.dart';

class ArticleArgs {
  final String articleId;

  ArticleArgs({
    required this.articleId,
  });
}

class ArticlePage extends StatelessWidget {

  final ArticleArgs args;

  const ArticlePage({super.key, required this.args});


  static Route route({
    required ArticleArgs args,
  }) => MaterialPageRoute(
    builder: (_) => ArticlePage(args: args),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleDetailController>(
      initState: (state) {
        Get.find<ArticleDetailController>().loadArticleDetail(args.articleId);
        // state.controller?.loadArticleDetail(args.articleId);
      },
      builder: (ArticleDetailController controller) {
        final articleDetail = controller.articleDetail.value;

        final rewriteUrl = articleDetail?.rewriteUrl;
        final articleTitle = articleDetail?.title;


        return Scaffold(
          appBar: AppBar(
            title:  Text(articleTitle ?? ''),
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness:Brightness.dark,
                statusBarBrightness:Brightness.light,
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
                        controller.shareArticle(url: rewriteUrl ?? '');
                      },
                    ),
                  ),
              ],
            ),
          body: ArticleView(article: articleDetail,),
        );
      }
    );
  }
}
