import 'package:app_ui/app_ui.dart' show AppCachedNetworkImage, AppHtmlWidget, AppSpacing;
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart' show ArticleResponse;

import '../../../app/app.dart';
import '../view/article_detail/article_detail.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    super.key, 
    required this.article,
  });

  final ArticleResponse article;

  @override
  Widget build(BuildContext context) {
    final Widget leading = article.imageUrl != null ? AppCachedNetworkImage(
      width: 100,
      uri: article.imageUrl!,
    ) : const SizedBox.shrink();
    final Widget title = Text(
      article.title, 
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    ); 
    // final Widget subtitle = Text(article.brief ?? '');
    final Widget subtitle = AppHtmlWidget(
      article.brief ?? '',
      textStyle: Theme.of(context).textTheme.bodySmall,
      customWidgetBuilder: (element) {
        return Text(
          element.text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context, 
          PageRouteName.articleDetail.routeLink,
          arguments: ArticleDetailArgs(articleId: article.id),  
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md, horizontal: AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading,
            const SizedBox(width: AppSpacing.lg),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: title),
                  subtitle,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
