import '../response/response.dart';

abstract class CategoryRepository {
  const CategoryRepository();
  
  Future<List<CategoryResponse>> getCategories();
}
