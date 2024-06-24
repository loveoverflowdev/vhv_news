import '../../core/news_api_client.dart';
import '../../core/endpoints.dart' as endpoints;

import '../response/response.dart';
import 'article_repository.dart';

class RemoteArticleRepository extends ArticleRepository {
  final NewsApiClient _apiClient;

  RemoteArticleRepository({
    required NewsApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<ArticleResponse>> getArticles({
    String? categoryId,
    required int page,
    required int pageSize,
  }) async {
    return _apiClient
      .selectAllMap(
        endpoints.article, 
        queryParameters: categoryId != null ? {
          'categoryId': categoryId,
          'itemsPerPage': pageSize,
          'pageNo': page,
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
