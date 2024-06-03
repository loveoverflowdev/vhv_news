import 'package:flutter_test/flutter_test.dart';

import 'package:dio/dio.dart';
import 'package:news_repository/news_repository.dart';

void main() async {
  NewsApiEndpoint.domain = 'vustavinhphuc.coquan.vn';
  final CategoryRepository categoryRepository = CategoryRepository.remote(
    apiClient: NewsApiClient.common(dio: Dio()),
  );
  test('Test if call LangsonNewsRepository select all response not empty list', () async {
    final categories = await categoryRepository.getCategories();
    // for (final article in articles) {
    //   // debugPrint(article.toJson().toString());
    // }

    expect(categories.isNotEmpty, true);
  });
}
