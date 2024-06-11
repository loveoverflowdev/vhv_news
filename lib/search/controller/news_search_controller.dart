
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

class NewsSearchController extends GetxController {
  late final SearchRepository _searchRepository;

  NewsSearchController({
    required SearchRepository searchRepository
  }) : 
  _searchRepository = searchRepository, 
  searchResult = Rx<SearchResponse?>(null),
  status = Rx<RxStatus>(RxStatus.empty()),
  _oldQuery = '';

  String _oldQuery;
  Rx<RxStatus> status;
  Rx<SearchResponse?> searchResult;

  @override
  void onInit() {
    super.onInit();
    search('');
  }

  Future<void> search(String query) async {
    if (query == _oldQuery) {
      return;
    }

    _oldQuery = query;

    status.value = RxStatus.loading();
    try {
      searchResult.value = await _searchRepository.search(query);
      status.value = RxStatus.success();
    } catch (e) {
      status.value = RxStatus.error(e.toString());
    }
  }

  @override
  void onClose() {
    searchResult.close();
    super.onClose();
  }

}
