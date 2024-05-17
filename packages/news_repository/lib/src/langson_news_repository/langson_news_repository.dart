
import 'response/response.dart';

export 'response/response.dart';
export 'langson_news_repository_impl.dart';

abstract class LangsonNewsRepository  {
  Future<List<ArticleResponse>> getArticles();
  Future<ArticleDetailResponse> getArticleDetail({required String id});
}
