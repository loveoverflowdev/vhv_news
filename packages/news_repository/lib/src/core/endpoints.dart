import 'package:news_repository/src/core/news_api_endpoint.dart';

const String domainName = 'vustavinhphuc.coquan.vn';

final article = NewsApiEndpoint(domain: domainName, resource: 'Content.Article');
final category = NewsApiEndpoint(domain: domainName, resource: 'Content.Category');
