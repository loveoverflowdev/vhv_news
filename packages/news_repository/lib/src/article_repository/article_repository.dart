export 'response/response.dart';

import 'response/response.dart';
import '../core/news_api_client.dart';
import '_remote_article_repository.dart';

abstract class ArticleRepository  {
  const ArticleRepository();

  factory ArticleRepository.remote({required NewsApiClient apiClient}) => RemoteArticleRepository(
    apiClient: apiClient,
  );

  Future<List<ArticleResponse>> getArticles({
    String? categoryId,
  });
  
  Future<ArticleDetailResponse> getArticleDetail({required String id});
}
