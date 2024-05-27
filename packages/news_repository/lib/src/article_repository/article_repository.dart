
import 'response/response.dart';

export 'response/response.dart';
export 'article_repository_impl.dart';

abstract class ArticleRepository  {
  Future<List<ArticleResponse>> getArticles({
    String? categoryId,
  });
  
  Future<ArticleDetailResponse> getArticleDetail({required String id});
}
