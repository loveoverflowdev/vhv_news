import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/app/controller/controller.dart';

class ArticlesController extends PagingController<ArticleResponse> {
  final ArticleRepository _articleRepository;
  String? _categoryId;

  ArticlesController({
    required ArticleRepository articleRepository,
  }) : 
    _articleRepository = articleRepository;

  void setCategoryId(String? id) {
    _categoryId = id;
  }

  @override
  Future<List<ArticleResponse>> internalGetResponseList({required int pageIndex}) {
    return _articleRepository.getArticles(
      categoryId: _categoryId,
      page: pageIndex,
      pageSize: pageSize,
    );
  }
}
