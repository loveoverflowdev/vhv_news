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
    try {
      status.value = RxStatus.loading();
      _articleRepository
        .getArticles(categoryId: categoryId)
        .then((response) {
          status.value = RxStatus.success();
          articles.value = response;
        });
    } catch (e, stackTrace) {
      status.value = RxStatus.error(e.toString());
      e.printError(info: stackTrace.toString());
    }
  }

  @override
  void onClose() {
    articles.close();
    status.close();
    super.onClose();
  }
}
