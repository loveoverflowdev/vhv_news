import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dio/dio.dart';
import 'package:news_repository/news_repository.dart';

void main() async {
  NewsApiEndpoint.domain = 'vustavinhphuc.coquan.vn';
  final ArticleRepository langsonNewsRepository = RemoteArticleRepository(
    apiClient: NewsApiClient.common(dio: Dio()),
  );
  test('Test if call LangsonNewsRepository select all response not empty list', () async {
    final articles = await langsonNewsRepository.getArticles(page: 0, pageSize: 5);

    debugPrint(articles.length.toString());

    // for (final article in articles) {
    //   // debugPrint(article.toJson().toString());
    // }

    expect(articles.isNotEmpty, true);
  });

  // test('Test if call LangsonNewsRepository select by id response valid', () async {
  //   final articleDetail = await langsonNewsRepository.getArticleDetail(id: id);

  //   debugPrint(articleDetail.toJson().toString());

  //   expect(articleDetail , id);
  // });
}
