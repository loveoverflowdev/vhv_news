import '../response/response.dart';

abstract class ArticleRepository  {
  const ArticleRepository();

  Future<List<ArticleResponse>> getArticles({
    String? categoryId,
  });
  
  Future<ArticleDetailResponse> getArticleDetail({required String id});
}
