import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

enum FeedStatus {
  initial,
  loading,
  success,
  error,
}

class FeedController extends GetxController {
  final LangsonNewsRepository _newsRepository;

  late RxList<ArticleResponse> articles;
  late RxStatus status;

  FeedController({
    required LangsonNewsRepository newsRepository,
  }) : _newsRepository = newsRepository;

  @override
  void onInit() async {
    super.onInit();
    _pure();
    status = RxStatus.loading();
    try {
      articles = await _newsRepository.getArticles().then((articles) => articles.obs);
      status = RxStatus.success();
    } catch (e) {
      status = RxStatus.error(e.toString());
    }
    update();
  }

  void _pure() {
    status = RxStatus.empty();
    articles = <ArticleResponse>[].obs;
    update();
  }
}
