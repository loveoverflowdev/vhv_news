import 'package:news_repository/src/core/news_api_endpoint.dart';

const String domainName = 'vustavinhphuc.coquan.vn';

final article = NewsApiEndpoint(resource: 'Content.Article');
final category = NewsApiEndpoint(resource: 'Content.Category');
final photoAlbum = NewsApiEndpoint(resource: 'Content.Article', articleType: ArticleType.photoAlbum);
final legalDocument = NewsApiEndpoint(resource: 'Content.Article', articleType: ArticleType.legalDocument);
final video = NewsApiEndpoint(resource: 'Content.Article', articleType: ArticleType.video);
final emagazine = NewsApiEndpoint(resource: 'Content.Article', articleType: ArticleType.emagazine);
