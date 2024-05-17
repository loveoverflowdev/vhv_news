import 'package:news_repository/src/core/news_api_client.dart';

import 'langson_news_repository.dart';
import 'endpoints.dart' as endpoints;

class LangsonNewsRepositoryImpl implements LangsonNewsRepository {
  final NewsApiClient _apiClient;

  LangsonNewsRepositoryImpl({
    required NewsApiClient apiClient,
  }) : _apiClient = apiClient;


  @override
  Future<List<ArticleResponse>> getArticles() async {
    return _apiClient
      .selectAll(endpoints.article)
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
