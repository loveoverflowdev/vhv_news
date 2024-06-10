import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dio/dio.dart';
import 'package:news_repository/src/core/core.dart';
import 'package:news_repository/src/video_repository/repository/video_repository.dart';

void main() async {
  NewsApiEndpoint.domain = 'vustavinhphuc.coquan.vn';
  final VideoRepository videoRepository = RemoteVideoRepository(
    apiClient: NewsApiClient.common(dio: Dio()),
  );
  test('Test if call LangsonNewsRepository select all response not empty list', () async {
    final articles = await videoRepository.getVideos(categoryId: '1881905');

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
