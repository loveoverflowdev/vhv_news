
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
    update();
  }


  void getCategories() {
    status.value = RxStatus.loading();
    _categoryRepository
      .getCategories()
      .then((respone) {
        status.value = RxStatus.success();

        categories.value = respone;
        if (categories.isNotEmpty) {
          selectedCategory.value = categories.first;
        }
        update();
      })
      .catchError((e) {
        status.value = RxStatus.error(e.toString());
        update();
      });
  }

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }
}
