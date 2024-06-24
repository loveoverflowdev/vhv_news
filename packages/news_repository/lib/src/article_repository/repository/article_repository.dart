import '../response/response.dart';

abstract class ArticleRepository  {
  const ArticleRepository();

  Future<List<ArticleResponse>> getArticles({
    String? categoryId,
    required int page,
    required int pageSize,
  });
  
  Future<ArticleDetailResponse> getArticleDetail({required String id});
}
