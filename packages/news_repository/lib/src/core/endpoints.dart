import 'package:news_repository/src/core/news_api_endpoint.dart';

final article = NewsApiEndpoint(resource: 'Content.Article');
final category = NewsApiEndpoint(resource: 'Content.Category');
final photoAlbum = NewsApiEndpoint(resource: 'Content.Article', articleType: ArticleType.photoAlbum);
final legalDocument = NewsApiEndpoint(resource: 'Content.Article', articleType: ArticleType.legalDocument);
final video = NewsApiEndpoint(resource: 'Content.Article', articleType: ArticleType.video);
final emagazine = NewsApiEndpoint(resource: 'Content.Article', articleType: ArticleType.emagazine);
final song = NewsApiEndpoint(resource: 'Content.Article', articleType: ArticleType.song);
final search = NewsApiEndpoint(resource: 'Content.Portal.ClientSearch');
