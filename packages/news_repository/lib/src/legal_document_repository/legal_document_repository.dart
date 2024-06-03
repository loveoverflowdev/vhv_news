export '_remote_legal_document_repository.dart';
export 'response/response.dart';

import 'response/response.dart';

abstract class LegalDocumentRepository {
  Future<List<LegalDocumentResponse>> getLegalDocuments();

  Future<LegalDocumentDetailResponse> getLegalDocumentDetail({required String id});
}
