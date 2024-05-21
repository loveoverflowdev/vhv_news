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
    print(endpoints.articleNews.apiUrl);
    return _apiClient
      .selectAll(endpoints.articleNews)
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
      .selectById(endpoints.articleNews, id: id)
      .then((response) => ArticleDetailResponse.fromJson(response));
  }
}
