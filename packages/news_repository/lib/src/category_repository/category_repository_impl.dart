import '../core/endpoints.dart' as endpoints;
import '../core/news_api_client.dart';

import 'category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final NewsApiClient _apiClient;

  CategoryRepositoryImpl({
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
