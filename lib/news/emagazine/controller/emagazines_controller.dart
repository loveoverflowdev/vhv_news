import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class EmagazinesController extends GetxController {

  EmagazinesController({
    required EmagazineRepository emagazineRepository
  }) : _emagazineRepository = emagazineRepository, 
    emagazines = RxList<EmagazineResponse>(), 
    status = Rx<RxStatus>(RxStatus.empty());

  final EmagazineRepository _emagazineRepository;
  final RxList<EmagazineResponse> emagazines;
  final Rx<RxStatus> status;

  Future<void> getEmagazines() async {
    status.value = RxStatus.loading();
    try {
      emagazines.value = await _emagazineRepository.getEmagazines();
      status.value = RxStatus.success();
    } catch (e, stackTrace) {
      status.value = RxStatus.error(e.toString());

      e.printError(info: stackTrace.toString());
    }
  }
}
