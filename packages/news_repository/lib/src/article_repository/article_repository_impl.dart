import 'package:news_repository/src/core/news_api_client.dart';

import 'article_repository.dart';
import '../core/endpoints.dart' as endpoints;

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiClient _apiClient;

  ArticleRepositoryImpl({
    required NewsApiClient apiClient,
  }) : _apiClient = apiClient;


  @override
  Future<List<ArticleResponse>> getArticles({
    String? categoryId,
  }) async {
    return _apiClient
      .selectAllMap(
        endpoints.article, 
        queryParameters: categoryId != null ? {
          'categoryId': categoryId,
        } : null,
      )
      .then(
        (responses) => responses.map((e) => ArticleResponse.fromJson(e)
      )
      .toList());
  }
  
  @override
  Future<ArticleDetailResponse> getArticleDetail({
    required String id,
  }) {
    return _apiClient
      .selectById(endpoints.article, id: id)
      .then((response) => ArticleDetailResponse.fromJson(response));
  }
}
