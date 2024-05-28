export 'photo_album_repository_impl.dart';

import 'response/photo_album_response/photo_album_response.dart';

abstract class PhotoAlbumRepository {
  Future<List<PhotoAlbumResponse>> getPhotoAlbums();

  Future<PhotoAlbumResponse> getPhotoAlbumDetail({required String id});
}
