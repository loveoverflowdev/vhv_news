import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_repository/news_repository.dart';

void main() async {
  NewsApiEndpoint.domain = 'vustavinhphuc.coquan.vn';
  final LegalDocumentRepository legalDocumentRepository = RemoteLegalDocumentRepository(
    apiClient: NewsApiClient.common(dio: Dio()),
  );

  test('Test if call select all response not empty list', () async {
    final documents = await legalDocumentRepository.getLegalDocuments();
    // for (final article in articles) {
    //   // debugPrint(article.toJson().toString());
    // }

    final documentDetail = await legalDocumentRepository.getLegalDocumentDetail(id: '6633506f852406cec30876c4');

    expect(documents.isNotEmpty, true);
  });
}
