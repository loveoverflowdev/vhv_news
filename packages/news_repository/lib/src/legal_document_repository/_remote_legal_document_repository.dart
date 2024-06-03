import '../core/news_api_client.dart';

import '../core/endpoints.dart' as endpoints;

import 'legal_document_repository.dart';

class RemoteLegalDocumentRepository extends LegalDocumentRepository {
  final NewsApiClient _apiClient;

  RemoteLegalDocumentRepository({
    required NewsApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<LegalDocumentDetailResponse> getLegalDocumentDetail({required String id}) {
    return _apiClient
      .selectById(
        endpoints.article,
        id: id,
      )
      .then(
        (response) => LegalDocumentDetailResponse.fromJson(response),
      );
  }

  @override
  Future<List<LegalDocumentResponse>> getLegalDocuments() {
    return _apiClient
      .selectAllMap(
        endpoints.article, 
      )
      .then(
        (responses) => responses.map((e) => LegalDocumentResponse.fromJson(e)
      )
      .toList());
  }
}
