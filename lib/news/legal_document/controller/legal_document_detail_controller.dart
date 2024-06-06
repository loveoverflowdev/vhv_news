
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class LegalDocumentDetailController extends GetxController {
  final LegalDocumentRepository _legalDocumentRepository;

  Rx<LegalDocumentDetailResponse?> legalDocumentDetail;
  Rx<RxStatus> status;

  LegalDocumentDetailController({
    required LegalDocumentRepository legalDocumentRepository,
  }) : _legalDocumentRepository = legalDocumentRepository,
    legalDocumentDetail = Rx<LegalDocumentDetailResponse?>(null),
    status = Rx<RxStatus>(RxStatus.empty());

  void getLegalDetailDocument({String? id}) async {
    status.value = RxStatus.loading();

    try {
      final legalDocumentDetail = await _legalDocumentRepository.getLegalDocumentDetail(id: id ?? '');
      this.legalDocumentDetail.value = legalDocumentDetail;
      status.value = RxStatus.success();
    } catch (e, stackTrace) {
      status.value = RxStatus.error(e.toString());

      e.printError(info: stackTrace.toString());
    }
  }

  @override
  void onClose() {
    legalDocumentDetail.close();
    status.close();
    super.onClose();
  }
}
