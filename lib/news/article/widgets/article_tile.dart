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
    final Widget title = Text(
      article.title, 
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    ); 
    // final Widget subtitle = Text(article.brief ?? '');
    final Widget subtitle = HtmlWidget(
      article.brief ?? '',
      textStyle: const TextStyle(
        height: 1.5,
        fontSize: 14.0,
      ),
      customWidgetBuilder: (element) {
        return Text(
          element.text,
          maxLines: 3,
        );
      },
    );
    return InkWell(
      onTap: () {
        onTap?.call(article);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
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
