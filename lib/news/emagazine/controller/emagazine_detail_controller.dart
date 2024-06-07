
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class EmagazineDetailController extends GetxController {

  EmagazineDetailController({
    required EmagazineRepository emagazineRepository
  }) : _emagazineRepository = emagazineRepository, 
    emagazineDetail = Rx<EmagazineDetailResponse?>(null),
    status = Rx<RxStatus>(RxStatus.empty());

  final EmagazineRepository _emagazineRepository;
  final Rx<EmagazineDetailResponse?> emagazineDetail;
  final Rx<RxStatus> status;

  Future<void> getEmagazineDetail({
    required String id,
  }) async {
    status.value = RxStatus.loading();
    try {
      emagazineDetail.value = await _emagazineRepository.getEmagazineDetail(
        id: id,
      );
      status.value = RxStatus.success();
    } catch (e, stackTrace) {
      status.value = RxStatus.error(e.toString());

      e.printError(info: stackTrace.toString());
    }
  }
}
