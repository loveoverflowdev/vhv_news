export '_remote_legal_document_repository.dart';
export 'response/response.dart';

import 'package:news_repository/news_repository.dart';

abstract class LegalDocumentRepository {
  factory LegalDocumentRepository.remote({
    required NewsApiClient apiClient,
  }) => RemoteLegalDocumentRepository(apiClient: apiClient);

  const LegalDocumentRepository();

  Future<List<LegalDocumentResponse>> getLegalDocuments({String? categoryId});

  Future<LegalDocumentDetailResponse> getLegalDocumentDetail({required String id});
}
