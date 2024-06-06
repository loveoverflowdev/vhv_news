
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:share_plus/share_plus.dart';

class ArticleDetailController extends GetxController {
  late Rx<ArticleDetailResponse?> articleDetail;

  final ArticleRepository _articleRepository;
  
  ArticleDetailController({
    required ArticleRepository articleRepository
  }) : _articleRepository = articleRepository;

  void loadArticleDetail(String id) async {
    articleDetail.value = await _articleRepository.getArticleDetail(id: id);
  }

  void shareArticle({
    required String url,
  }) {
    Share.share(url);
  }

  @override
  void onInit() {
    super.onInit();
    articleDetail = Rx<ArticleDetailResponse?>(null);
  }

  @override
  void onClose() {
    articleDetail.close();
    super.onClose();
  }
}
