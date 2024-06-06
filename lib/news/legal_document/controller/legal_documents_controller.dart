
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class LegalDocumentsController extends GetxController {
  final LegalDocumentRepository _legalDocumentRepository;

  RxList<LegalDocumentResponse> legalDocuments;
  Rx<RxStatus> status;

  LegalDocumentsController({
    required LegalDocumentRepository legalDocumentRepository,
  }) : _legalDocumentRepository = legalDocumentRepository,
    legalDocuments = <LegalDocumentResponse>[].obs,
    status = Rx<RxStatus>(RxStatus.empty());

  void getLegalDocuments({String? categoryId}) async {
    status.value = RxStatus.loading();

    try {
      final legalDocuments = await _legalDocumentRepository.getLegalDocuments(categoryId: categoryId);
      this.legalDocuments.value = legalDocuments;
      status.value = RxStatus.success();
    } catch (e, stackTrace) {
      status.value = RxStatus.error(e.toString());

      e.printError(info: stackTrace.toString());
    }
  }

  @override
  void onClose() {
    legalDocuments.close();
    status.close();
    super.onClose();
  }
}
