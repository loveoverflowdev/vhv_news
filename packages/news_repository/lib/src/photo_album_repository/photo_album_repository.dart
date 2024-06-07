export 'response/response.dart';

import '../core/news_api_client.dart';
import '_remote_photo_album_repository.dart';

import 'response/photo_album_response/photo_album_response.dart';

abstract class PhotoAlbumRepository {
  const PhotoAlbumRepository();

  factory PhotoAlbumRepository.remote({required NewsApiClient apiClient}) => RemotePhotoAlbumRepository(apiClient: apiClient);

  Future<List<PhotoAlbumResponse>> getPhotoAlbums({required String categoryId});

  Future<PhotoAlbumResponse> getPhotoAlbumDetail({required String id});
}
