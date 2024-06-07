import '../core/endpoints.dart' as endpoints;

import '../core/news_api_client.dart';
import 'photo_album_repository.dart';

class RemotePhotoAlbumRepository extends PhotoAlbumRepository {
  final NewsApiClient _apiClient;

  RemotePhotoAlbumRepository({
    required NewsApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<PhotoAlbumResponse>> getPhotoAlbums({
    required String categoryId,
  }) {
    return _apiClient
      .selectAllMap(
        endpoints.photoAlbum,
        queryParameters: {
          'categoryId': categoryId,
        },
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
