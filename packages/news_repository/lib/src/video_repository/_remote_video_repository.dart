import '../core/news_api_client.dart';
import 'response/response.dart';
import 'video_repository.dart';

import '../core/endpoints.dart' as endpoints;

class RemoteVideoRepository extends VideoRepository {
  final NewsApiClient _apiClient;

  RemoteVideoRepository({
    required NewsApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<VideoDetailResponse> getVideoDetail({required String id}) {
    return _apiClient
      .selectById(endpoints.video, id: id)
      .then((response) => VideoDetailResponse.fromJson(response));
  }

  @override
  Future<List<VideoResponse>> getVideos() {
    return _apiClient
      .selectAllMap(
        endpoints.video, 
      )
      .then(
        (responses) => responses.map((e) => VideoResponse.fromJson(e)
      )
      .toList());
  }
}
