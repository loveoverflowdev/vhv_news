import 'package:app_ui/app_ui.dart' show AppSpacing;
import 'package:cached_network_image/cached_network_image.dart' show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:news_repository/news_repository.dart' show ArticleResponse;

class FeedTile extends StatelessWidget {
  const FeedTile({
    super.key, 
    required this.article,
    required this.onTap,
  });

  final void Function()? onTap;
  final ArticleResponse article;

  @override
  Widget build(BuildContext context) {
    final Widget leading = article.imageUrl != null ? Padding(
      padding: const EdgeInsets.all(AppSpacing.xs),
      child: CachedNetworkImage(
        width: 100,
        fit: BoxFit.cover,
        imageUrl: article.imageUrl!,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
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
        onTap?.call();
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
