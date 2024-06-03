
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class PhotoAlbumsController extends GetxController {
  final PhotoAlbumRepository _photoAlbumRepository;

  RxList<PhotoAlbumResponse> photoAlbums;
  Rx<RxStatus> status;

  PhotoAlbumsController({
    required PhotoAlbumRepository photoAlbumRepository
  }) : 
    _photoAlbumRepository = photoAlbumRepository, 
    status = Rx<RxStatus>(RxStatus.empty()),
    photoAlbums = RxList<PhotoAlbumResponse>([]);

  void getPhotoAlbums() async {
    status.value = RxStatus.loading();
    update();

    try {
      photoAlbums.value = await _photoAlbumRepository.getPhotoAlbums();
      status.value = RxStatus.success();
    } catch (e) {
      status.value = RxStatus.error(e.toString());
    } finally {
      update();
    }
  }

  @override
  void onClose() {
    photoAlbums.close();
    status.close();
    super.onClose();
  }
}
