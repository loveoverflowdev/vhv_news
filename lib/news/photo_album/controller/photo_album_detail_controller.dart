
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class PhotoAlbumDetailController extends GetxController {
  final PhotoAlbumRepository _photoAlbumRepository;

  Rx<PhotoAlbumResponse?> photoAlbum;
  Rx<RxStatus> status;

  PhotoAlbumDetailController({
    required PhotoAlbumRepository photoAlbumRepository,
  }) : 
  _photoAlbumRepository = photoAlbumRepository,
  photoAlbum = Rx<PhotoAlbumResponse?>(null),
  status = Rx<RxStatus>(RxStatus.empty());

  void getPhotoAlbum({
    required String id,
  }) async {
    status.value = RxStatus.loading();

    try {
     photoAlbum.value = await _photoAlbumRepository.getPhotoAlbumDetail(id: id);
      status.value = RxStatus.success();
    } catch (e, stackTrace) {
      status.value = RxStatus.error(e.toString());

      e.printError(info: stackTrace.toString());
    } 
  }

  @override
  void onClose() {
    photoAlbum.close();
    status.close();
    super.onClose();
  }
}
