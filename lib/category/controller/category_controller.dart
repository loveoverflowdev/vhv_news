
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class CategoryController extends GetxController {
  final CategoryRepository _categoryRepository;

  CategoryController({
    required CategoryRepository categoryRepository,
  }) : 
  _categoryRepository = categoryRepository, 
  status = RxStatus.empty().obs,
  selectedCategory = Rx<CategoryResponse?>(null),
  categories = <CategoryResponse>[].obs;
  
  final Rx<RxStatus> status;
  final Rx<CategoryResponse?> selectedCategory;
  final RxList<CategoryResponse> categories;

  void selectCategory(CategoryResponse category) {
    selectedCategory.value = category;
  }

  void getCategories() async {
    status.value = RxStatus.loading();
    
    try {
      final categoryResponses = await _categoryRepository
        .getCategories();
      categories.value = categoryResponses;
      if (categoryResponses.isNotEmpty) {
        selectedCategory.value = categoryResponses.first;
      }
      status.value = RxStatus.success();
    } catch (e, stackTrace) {
      status.value = RxStatus.error(e.toString());
      e.printError(info: stackTrace.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }
}
