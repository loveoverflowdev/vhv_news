export 'remote_legal_document_repository.dart';
export 'response/response.dart';

import 'package:news_repository/news_repository.dart';

abstract class LegalDocumentRepository {
  const LegalDocumentRepository();

  Future<List<LegalDocumentResponse>> getLegalDocuments({String? categoryId});

  Future<LegalDocumentDetailResponse> getLegalDocumentDetail({required String id});

  Future<dynamic> downloadFile({required String url, void Function(int, int)? onReceiveProgress});
}
