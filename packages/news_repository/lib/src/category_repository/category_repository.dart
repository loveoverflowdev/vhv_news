export 'response/response.dart';
export 'remote_category_repository.dart';

import '../../news_repository.dart';

abstract class CategoryRepository {
  const CategoryRepository();
  
  Future<List<CategoryResponse>> getCategories();
}
