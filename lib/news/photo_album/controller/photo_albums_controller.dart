
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

  void getPhotoAlbums({
    required String categoryId,
  }) async {
    status.value = RxStatus.loading();

    try {
      final response = await _photoAlbumRepository.getPhotoAlbums(categoryId: categoryId);
      photoAlbums.value = [...response, ...response];
      status.value = RxStatus.success();
    } catch (e, stackTrace) {
      status.value = RxStatus.error(e.toString());

      e.printError(info: stackTrace.toString());
    }
  }

  @override
  void onClose() {
    photoAlbums.close();
    status.close();
    super.onClose();
  }
}
