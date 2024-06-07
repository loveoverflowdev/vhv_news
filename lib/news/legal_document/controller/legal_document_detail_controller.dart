
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:path_provider/path_provider.dart';

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

  Future<String> downloadFile(String? url, {
    void Function(int, int)? onReceiveProgress,
  }) async {
    if (url == null) {
      throw Exception('URL is null');
    }

    final fileName = url.split('/').last;
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';

    final file = File(filePath);

    if (file.existsSync()) {
      return filePath;
    }

    // Notify the user
    log('Downloading file from $url to $filePath');
    
    // Download the file
    final response = await _legalDocumentRepository.downloadFile(url: url, onReceiveProgress: onReceiveProgress);
    
    await file.writeAsBytes(response);

    // Notify the user
    log('File downloaded to $filePath');
    return filePath;
  }

  @override
  void onClose() {
    legalDocumentDetail.close();
    status.close();
    super.onClose();
  }
}
