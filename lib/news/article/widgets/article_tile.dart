import 'package:app_ui/app_ui.dart' show AppCachedNetworkImage, AppSpacing;
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:news_repository/news_repository.dart' show ArticleResponse;

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    super.key, 
    required this.article,
    required this.onTap,
  });

  final void Function(ArticleResponse)? onTap;
  final ArticleResponse article;

  @override
  Widget build(BuildContext context) {
    final Widget leading = article.imageUrl != null ? Padding(
      padding: const EdgeInsets.all(AppSpacing.xs),
      child: AppCachedNetworkImage(
        width: 100,
        uri: article.imageUrl!,
      ),
    ) : const SizedBox.shrink();
    final Widget title = Text(article.title, style: Theme.of(context).textTheme.titleLarge); 
    // final Widget subtitle = Text(article.brief ?? '');
    final Widget subtitle = ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 80),
      child: HtmlWidget(
        article.brief ?? '',
        textStyle: const TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
    return GestureDetector(
      onTap: () {
        onTap?.call(article);
      },
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
    );
  }
}
