export 'response/response.dart';
import '../../news_repository.dart';

import '_remote_category_repository.dart';

abstract class CategoryRepository {
  const CategoryRepository();
  
  factory CategoryRepository.remote({required NewsApiClient apiClient}) => RemoteCategoryRepository(apiClient: apiClient);

  Future<List<CategoryResponse>> getCategories();
}
