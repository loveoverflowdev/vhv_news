import 'response/response.dart';

export 'response/response.dart';
export 'category_repository_impl.dart';

abstract class CategoryRepository {
  Future<List<CategoryResponse>> getCategories();
}
