import 'package:news_repository/news_repository.dart';

import '../../core/endpoints.dart' as endpoints;
import '../response/response.dart';
import 'song_repository.dart';

class RemoteSongRepository extends SongRepository {
  final NewsApiClient _apiClient;

  RemoteSongRepository({
    required NewsApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<SongResponse>> getSongs({
    String? categoryId,
  }) async {
    return _apiClient
      .selectAllMap(endpoints.song, 
        queryParameters: categoryId == null 
        ? null 
        : {
          'categoryId': categoryId,
        }
      )
      .then((response) 
        => response.map((e) => SongResponse.fromJson(e))
      .toList());
  }
}
