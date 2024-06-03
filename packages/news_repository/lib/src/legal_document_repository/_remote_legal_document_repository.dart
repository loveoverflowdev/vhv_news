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
        endpoints.legalDocument,
        id: id,
      )
      .then(
        (response) => LegalDocumentDetailResponse.fromJson(response),
      );
  }

  @override
  Future<List<LegalDocumentResponse>> getLegalDocuments({String? categoryId}) {
    return _apiClient
      .selectAllMap(
        endpoints.legalDocument,
        queryParameters: categoryId != null ? {'categoryId': categoryId} : null,
      )
      .then(
        (responses) => responses.map((e) => LegalDocumentResponse.fromJson(e)
      )
      .toList());
  }
}
