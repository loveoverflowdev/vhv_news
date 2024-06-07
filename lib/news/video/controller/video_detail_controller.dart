
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class VideoDetailController {
  final VideoRepository _videoRepository;

  final Rx<VideoDetailResponse?> videoDetail;
  final Rx<RxStatus> status;

  VideoDetailController({
    required VideoRepository videoRepository,
  }) : _videoRepository = videoRepository,
        videoDetail = Rx<VideoDetailResponse?>(null),
        status = Rx<RxStatus>(RxStatus.empty()); 

  Future<void> getVideoDetail({
    required String videoId,
  }) async {
    status.value = RxStatus.loading();

    try {
      await _videoRepository.getVideoDetail(id: videoId)
        .then((value) {
          videoDetail.value = value;
          status.value = RxStatus.success();
        });
    } catch (e, stackTrace) {
      status.value = RxStatus.error(e.toString());

      e.printError(info: stackTrace.toString());
    }
  }
}
