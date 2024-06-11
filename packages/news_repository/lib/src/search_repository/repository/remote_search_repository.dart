import 'package:news_repository/news_repository.dart';

import '../../core/endpoints.dart' as endpoints;


class RemoteSearchRepository extends SearchRepository {
  final NewsApiClient _apiClient;

  RemoteSearchRepository({
    required NewsApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<SearchResponse> search(String keyword) {
    return _apiClient.search(endpoints.search, keyword: keyword)
    .then((response) => SearchResponse.fromJson(response));
  }
}
