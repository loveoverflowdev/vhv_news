export 'legal_document_repository_impl.dart';
export 'response/response.dart';

import 'response/response.dart';

abstract class LegalDocumentRepository {
  Future<List<LegalDocumentResponse>> getLegalDocuments();

  Future<LegalDocumentDetailResponse> getLegalDocumentDetail({required String id});
}
