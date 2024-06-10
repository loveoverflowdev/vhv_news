import '../response/response.dart';

abstract class LegalDocumentRepository {
  const LegalDocumentRepository();

  Future<List<LegalDocumentResponse>> getLegalDocuments({String? categoryId});

  Future<LegalDocumentDetailResponse> getLegalDocumentDetail({required String id});

  Future<dynamic> downloadFile({required String url, void Function(int, int)? onReceiveProgress});
}
