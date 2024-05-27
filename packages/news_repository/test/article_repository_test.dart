import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dio/dio.dart';
import 'package:news_repository/src/core/core.dart';
import 'package:news_repository/src/article_repository/article_repository.dart';

void main() async {
  // Dio dio = Dio();
  // final response = await dio.get('https://langson.coquan.vn/api/Content.Article/select/64b7566f2142e64b4408991a');
  // print(jsonDecode(response.data));

  final ArticleRepository langsonNewsRepository = ArticleRepositoryImpl(
    apiClient: NewsApiClient(dio: Dio()),
  );
  test('Test if call LangsonNewsRepository select all response not empty list', () async {
    final articles = await langsonNewsRepository.getArticles();

    debugPrint(articles.length.toString());

    // for (final article in articles) {
    //   // debugPrint(article.toJson().toString());
    // }

    expect(articles.isNotEmpty, true);
  });

  const id = '6555c355dcced49cf60b700d';
  // test('Test if call LangsonNewsRepository select by id response valid', () async {
  //   final articleDetail = await langsonNewsRepository.getArticleDetail(id: id);

  //   debugPrint(articleDetail.toJson().toString());

  //   expect(articleDetail , id);
  // });
}
