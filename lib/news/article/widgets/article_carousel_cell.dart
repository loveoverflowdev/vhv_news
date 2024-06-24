
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/app/app.dart';
import 'package:vhv_news/news/article/article.dart';

class ArticleCarouselCell extends StatelessWidget {
  const ArticleCarouselCell({
    super.key, 
    required this.article,
  });

  final ArticleResponse article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context, 
          PageRouteName.articleDetail.routeLink,
          arguments: ArticleDetailArgs(articleId: article.id),  
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: Stack(
          children: <Widget>[
            Image.network(article.imageUrl ?? '', fit: BoxFit.cover, width: double.infinity, height: double.infinity),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      article.title,
                      maxLines: 3,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    SizedBox(
                      height: 60,
                      child: AppHtmlWidget(
                        article.brief ?? '',
                        textStyle: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    // Text(
                    //   description,
                    //   maxLines: 4,
                    //   style: const TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 14.0,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
