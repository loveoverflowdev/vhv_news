import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class ArticlesController extends GetxController {
  final ArticleRepository _articleRepository;

  late RxList<ArticleResponse> articles;
  late Rx<RxStatus> status;

  ArticlesController({
    required ArticleRepository articleRepository,
  }) : 
    _articleRepository = articleRepository, 
    status = RxStatus.empty().obs,
    articles = <ArticleResponse>[].obs;

  void getArticles({
    String? categoryId,
  }) async {
    status.value = RxStatus.loading();
    _articleRepository
      .getArticles(categoryId: categoryId)
      .then((response) {
        status.value = RxStatus.success();
        articles.value = response;
        update();
      })
      .catchError((e) {
        status.value = RxStatus.error(e.toString());
        update();
      });
  }
}
