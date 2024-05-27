
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vhv_news/article/article.dart';


class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleDetailController>(
      builder: (ArticleDetailController controller) {
        final rewriteUrl = controller.articleDetail.value?.rewriteUrl;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Article Page'),
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
                      onPressed: () {},
                    ),
                  ),
              ],
            ),
          body: const ArticleView(),
        );
      }
    );
  }
}
