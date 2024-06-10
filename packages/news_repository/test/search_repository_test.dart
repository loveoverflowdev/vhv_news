import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dio/dio.dart';
import 'package:news_repository/news_repository.dart';

void main() async {
  NewsApiEndpoint.domain = 'vustavinhphuc.coquan.vn';
  final SearchRepository searchRepo = RemoteSearchRepository(
    apiClient: NewsApiClient.common(dio: Dio()),
  );

  test('Test if call search response not empty list', () async {
    final search = await searchRepo.search('hoạt');

    // for (final article in articles) {
    //   // debugPrint(article.toJson().toString());
    // }
    debugPrint(search.toJson().toString());
    expect(search.songs.isNotEmpty, true);
  });
}

