export 'response/response.dart';

import '../core/news_api_client.dart';
import '_remote_video_repository.dart';
import 'response/response.dart';

abstract class VideoRepository {
  const VideoRepository();

  factory VideoRepository.remote({required NewsApiClient apiClient}) => RemoteVideoRepository(apiClient: apiClient);

  Future<List<VideoResponse>> getVideos();

  Future<VideoDetailResponse> getVideoDetail({required String id});
}
