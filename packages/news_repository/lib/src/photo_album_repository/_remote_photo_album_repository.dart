import 'package:news_repository/news_repository.dart';

import '../core/endpoints.dart' as endpoints;

import 'response/response.dart';

class RemotePhotoAlbumRepository extends PhotoAlbumRepository {
  final NewsApiClient _apiClient;

  RemotePhotoAlbumRepository({
    required NewsApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<PhotoAlbumResponse>> getPhotoAlbums() {
    return _apiClient
      .selectAllMap(
        endpoints.article, 
      )
      .then(
        (responses) => responses.map((e) => PhotoAlbumResponse.fromJson(e)
      )
      .toList());
  }

  @override
  Future<PhotoAlbumResponse> getPhotoAlbumDetail({required String id}) {
    return _apiClient
      .selectById(endpoints.photoAlbum, id: id)
      .then((response) => PhotoAlbumResponse.fromJson(response));
  }
}
