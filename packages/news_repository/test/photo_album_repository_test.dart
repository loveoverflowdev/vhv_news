import 'package:flutter_test/flutter_test.dart';

import 'package:dio/dio.dart';
import 'package:news_repository/news_repository.dart';

void main() async {
  NewsApiEndpoint.domain = 'vustavinhphuc.coquan.vn';
  final PhotoAlbumRepository photoAlbumRepository = PhotoAlbumRepositoryImpl(
    apiClient: NewsApiClient(dio: Dio()),
  );

  test('Test if call select all response not empty list', () async {
    final photoAlbum = await photoAlbumRepository.getPhotoAlbums();
    // for (final article in articles) {
    //   // debugPrint(article.toJson().toString());
    // }

    expect(photoAlbum.isNotEmpty, true);
  });
}