export 'response/response.dart';
export 'remote_photo_album_repository.dart';

import 'response/photo_album_response/photo_album_response.dart';

abstract class PhotoAlbumRepository {
  const PhotoAlbumRepository();

  Future<List<PhotoAlbumResponse>> getPhotoAlbums({required String categoryId});

  Future<PhotoAlbumResponse> getPhotoAlbumDetail({required String id});
}
