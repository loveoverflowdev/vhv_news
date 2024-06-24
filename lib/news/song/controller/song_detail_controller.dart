import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class SongDetailController extends GetxController {
  final SongRepository _songRepository;

  final Rx<SongDetailResponse?> songDetail;
  final Rx<RxStatus> status;


  SongDetailController({
    required SongRepository songRepository,
  }) 
    : _songRepository = songRepository,
    songDetail = Rx<SongDetailResponse?>(null), 
    status = Rx<RxStatus>(RxStatus.empty());

  Future<void> getSongDetail({
    required String id,
  }) async {
    status.value = RxStatus.loading();

    try {
      final response = await _songRepository.getSongDetail(id: id);
      songDetail.value = response;
      status.value = RxStatus.success();
    } catch (e) {
      status.value = RxStatus.error(e.toString());
    }
  }
  
  @override
  void dispose() {
    songDetail.close();
    status.close();
    super.dispose();
  }
}
