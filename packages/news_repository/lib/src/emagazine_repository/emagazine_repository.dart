export 'response/response.dart';

import '../core/news_api_client.dart';
import '_remote_emagazine_repository.dart';
import 'response/response.dart';

abstract class EmagazineRepository {
  const EmagazineRepository();

  factory EmagazineRepository.remote({required NewsApiClient apiClient}) => RemoteEmagazineRepository(apiClient: apiClient);

  Future<List<EmagazineResponse>> getEmagazines();

  Future<EmagazineDetailResponse> getEmagazineDetail({required String id});
}
