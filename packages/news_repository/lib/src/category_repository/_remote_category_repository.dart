import '../core/endpoints.dart' as endpoints;
import '../core/news_api_client.dart';

import 'category_repository.dart';

class RemoteCategoryRepository extends CategoryRepository {
  final NewsApiClient _apiClient;

  RemoteCategoryRepository({
    required NewsApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<CategoryResponse>> getCategories() {
    return _apiClient.selectAllList(endpoints.category)
      .then((responses) 
        => responses.map((e) 
          => CategoryResponse.fromJson(e)).toList()
      );
  }
}
