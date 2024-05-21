
import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

import '../controller/feed_controller.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedController>(
      init: FeedController(newsRepository: Get.find()),
      builder: (FeedController controller) { 
        final status = controller.status;
        final articles = controller.articles;
        if (status.isEmpty) {
          return const Center(child: Text('No Data'));
        }
        if (status.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (status.isError) {
          return Center(child: Text('Error: ${status.errorMessage ?? ''}'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.lg),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return _FeedTile(article: article);
          }, separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
      },
    );
  }
}

class _FeedTile extends StatelessWidget {
  const _FeedTile({
    required this.article,
  });

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
    final Widget subtitle = Text(article.brief ?? '');

    return Row(
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
    );
  }
}
