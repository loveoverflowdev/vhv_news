
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class ArticleController extends GetxController {
  late Rx<ArticleDetailResponse?> articleDetail;

  final LangsonNewsRepository _newsRepository;
  
  ArticleController({
    required LangsonNewsRepository newsRepository
  }) : _newsRepository = newsRepository;

  void loadArticleDetail(String id) async {
    articleDetail.value = await _newsRepository.getArticleDetail(id: id);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    articleDetail = null.obs;
  }
}
