import 'package:news_repository/src/core/news_api_endpoint.dart';

const String domainName = 'langson.coquan.vn';

final articleNews = NewsApiEndpoint(domain: domainName, resource: 'Content.Article');
