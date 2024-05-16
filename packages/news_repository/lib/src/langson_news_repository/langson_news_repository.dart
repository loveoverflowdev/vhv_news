
import 'response/response.dart';

abstract class LangsonNewsRepository  {
  Future<List<ArticleResponse>> getArticles();
  Future<ArticleDetailResponse> getArticleDetail({required String id});
}
