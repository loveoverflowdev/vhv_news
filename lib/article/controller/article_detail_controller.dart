
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class ArticleDetailController extends GetxController {
  late Rx<ArticleDetailResponse?> articleDetail;

  final ArticleRepository _articleRepository;
  
  ArticleDetailController({
    required ArticleRepository articleRepository
  }) : _articleRepository = articleRepository;

  void loadArticleDetail(String id) async {
    articleDetail.value = await _articleRepository.getArticleDetail(id: id);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    articleDetail = null.obs;
  }
}
