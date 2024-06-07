import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';


class VideosController extends GetxController {
  final VideoRepository _videoRepository;

  final Rx<List<VideoResponse>> videos;
  final Rx<RxStatus> status;

  VideosController({
    required VideoRepository videoRepository,
  }) : _videoRepository = videoRepository,
        videos = Rx<List<VideoResponse>>([]),
        status = Rx<RxStatus>(RxStatus.empty());


  Future<void > getVideos({
    required String categoryId,
  }) async  {
    status.value = RxStatus.loading();

    try {
      final response = await _videoRepository.getVideos(categoryId: categoryId);
      videos.value = response;
      status.value = RxStatus.success();
    } catch (error, stackTrace) {
      status.value = RxStatus.error(error.toString());
      error.printError(info: stackTrace.toString());
    }
  }
}
