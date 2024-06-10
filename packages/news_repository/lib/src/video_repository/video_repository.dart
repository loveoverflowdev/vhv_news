export 'response/response.dart';
export 'remote_video_repository.dart';

import 'response/response.dart';

abstract class VideoRepository {
  const VideoRepository();

  Future<List<VideoResponse>> getVideos({required String categoryId});

  Future<VideoDetailResponse> getVideoDetail({required String id});
}
