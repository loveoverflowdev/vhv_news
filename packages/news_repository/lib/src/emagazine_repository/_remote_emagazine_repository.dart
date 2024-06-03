import '../core/endpoints.dart' as endpoints;
import '../core/news_api_client.dart';
import 'emagazine_repository.dart';
import 'response/response.dart';

class RemoteEmagazineRepository extends EmagazineRepository {
  final NewsApiClient _apiClient;

  RemoteEmagazineRepository({
    required NewsApiClient apiClient,
  }) : _apiClient = apiClient;
  
  @override
  Future<EmagazineDetailResponse> getEmagazineDetail({required String id}) {
     return _apiClient
      .selectById(endpoints.emagazine, id: id)
      .then((response) => EmagazineDetailResponse.fromJson(response));
  }

  @override
  Future<List<EmagazineResponse>> getEmagazines() {
    return _apiClient
      .selectAllMap(
        endpoints.video, 
      )
      .then(
        (responses) => responses.map((e) => EmagazineResponse.fromJson(e)
      )
      .toList(),);
  }
}
